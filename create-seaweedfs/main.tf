locals {
  chart_values = {
    "POSTGRESQL_HOST"     = var.postgresql_host
    "POSTGRESQL_PORT"     = var.postgresql_port
    "POSTGRESQL_DATABASE" = var.postgresql_database
    "POSTGRESQL_USERNAME" = var.postgresql_username
    "POSTGRESQL_SECRET"   = var.postgresql_password_secret
    "FILER_ENDPOINT"      = "http://${local.release_name}-filer.${var.namespace}.svc.cluster.local:8888"
    "S3_AUTH_SECRET"      = "${local.release_name}-s3-config"
    "S3_INIT_BUCKETS"     = ["argo-workflows"]
  }
  s3_config_values = {
    "ARGO_WORKFLOWS_USERNAME" = data.kubernetes_secret.seaweedfs_postgres_config.data.argo-workflows-username
    "ARGO_WORKFLOWS_PASSWORD" = data.kubernetes_secret.seaweedfs_postgres_config.data.argo-workflows-password
  }
  release_name            = "seaweedfs-${var.namespace}"
  argo_workflows_username = "argo_workflows"
}

data "kubernetes_secret" "seaweedfs_postgres_config" {
  metadata {
    name = "seaweedfs-${var.namespace}-s3-auth"
    namespace = var.namespace
  }
}

resource "helm_release" "seaweedfs" {
  name       = local.release_name
  repository = var.helm_chart_repository
  chart      = var.helm_chart_name
  version    = var.helm_chart_version
  namespace  = var.namespace

  reset_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.chart_values)
  ]
}
