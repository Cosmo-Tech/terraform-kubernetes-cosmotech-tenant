terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

locals {
  values_argo = {
    "ARGO_SERVICE_ACCOUNT"        = local.argo_service_account
    "ARGO_BUCKET_NAME"            = var.argo_bucket_name
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "MINIO_RELEASE_NAME"          = local.minio_release_name
    "NAMESPACE"                   = var.namespace
    "POSTGRES_RELEASE_NAME"       = var.postgres_release_name
    "ARGO_DATABASE"               = var.argo_database
    "ARGO_POSTGRESQL_SECRET_NAME" = var.argo_postgresql_secret_name
    "REQUEUE_TIME"                = var.requeue_time
    "ARCHIVE_TTL"                 = var.archive_ttl
  }
  instance_name        = "${var.argo_release_name}-${var.namespace}"
  argo_service_account = "argo-${var.namespace}-service-account"
  minio_release_name   = "${var.minio_release_name}-${var.namespace}"
}

locals {
  crds = [
    "argoproj.io_clusterworkflowtemplates.yaml",
    "argoproj.io_cronworkflows.yaml",
    # "argoproj.io_workflowartifactgctasks.yaml", # Rollback to 0.16.6 version
    "argoproj.io_workfloweventbindings.yaml",
    "argoproj.io_workflows.yaml",
    "argoproj.io_workflowtaskresults.yaml",
    "argoproj.io_workflowtasksets.yaml",
    "argoproj.io_workflowtemplates.yaml"
  ]
  argo_version = "v3.3.8"
}

data "http" "argo_crds" {
  for_each = toset(local.crds)
  url      = "https://raw.githubusercontent.com/argoproj/argo-workflows/${local.argo_version}/manifests/base/crds/minimal/${each.key}"
}

data "kubectl_file_documents" "argo_crds" {
  for_each = data.http.argo_crds
  content  = each.value.response_body
}

# Destroying tenant will also destroy CRDS resources. But being clusterwide, il will impact others Argo installations on the platform
# A temporary solution could be to remove this resource from state file before destroying the full tenant resources:
# terraform state rm "module.platform-tenant-resources.module.create-argo.kubectl_manifest.argo_crds"
resource "kubectl_manifest" "argo_crds" {
  for_each  = data.kubectl_file_documents.argo_crds
  yaml_body = data.kubectl_file_documents.argo_crds[each.key].documents[0]

  override_namespace = var.namespace
}

resource "helm_release" "argo" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.argo_version
  namespace  = var.namespace

  reuse_values = true
  skip_crds    = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_argo)
  ]

  depends_on = [kubectl_manifest.argo_crds]
}

# Experimental: gives helm time to finish cleaning up.
#
# Otherwise, after `terraform destroy`:
# │ Error: uninstallation completed with 1 error(s): uninstall: Failed to purge
#   the release: release: not found
resource "time_sleep" "wait_30_seconds" {
  depends_on = [helm_release.argo]

  destroy_duration = "60s"
}