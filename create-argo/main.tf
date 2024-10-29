locals {
  values_argo = {
    "ARGO_SERVICE_ACCOUNT"        = local.argo_service_account
    "ARGO_BUCKET_NAME"            = var.argo_bucket_name
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "MINIO_RELEASE_NAME"          = var.minio_release_name
    "USE_MINIO_STORAGE"           = var.use_minio_storage
    "NAMESPACE"                   = var.namespace
    "POSTGRES_RELEASE_NAME"       = var.postgres_release_name
    "ARGO_DATABASE"               = var.argo_database
    "ARGO_POSTGRESQL_SECRET_NAME" = var.argo_postgresql_secret_name
    "REQUEUE_TIME"                = var.requeue_time
    "ARCHIVE_TTL"                 = var.archive_ttl
    "INSTALL_CRDS"                = var.install_argo_crds
    "INSTALL_CRDS"                = var.install_argo_crds
  }
  argo_service_account = "argo-workflows-${var.namespace}-service-account"
}

resource "helm_release" "argo" {
  name       = "argo-workflows-${var.namespace}"
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reset_values = true
  skip_crds    = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_argo)
  ]
}

# Experimental: gives helm time to finish cleaning up.
#
# Otherwise, after `terraform destroy`:
# │ Error: uninstallation completed with 1 error(s): uninstall: Failed to purge
#   the release: release: not found
resource "time_sleep" "wait_30_seconds" {
  depends_on = [helm_release.argo]

  destroy_duration = "30s"
}
