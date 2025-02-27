locals {
  values_argo = {
    "ARGO_SERVICE_ACCOUNT"        = local.argo_service_account
    "ARGO_BUCKET_NAME"            = var.argo_bucket_name
    "ARGO_POSTGRESQL_USER"        = var.postgres_argo_user
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "S3_ENDPOINT"                 = var.s3_endpoint
    "S3_BUCKET_NAME"              = var.s3_bucket_name
    "S3_CREDENTIALS_SECRET"       = var.s3_credentials_secret
    "S3_USERNAME_KEY"             = var.s3_username_key
    "S3_PASSWORD_KEY"             = var.s3_password_key
    "NAMESPACE"                   = var.namespace
    "POSTGRES_RELEASE_NAME"       = var.postgres_release_name
    "ARGO_DATABASE"               = var.argo_database
    "ARGO_POSTGRESQL_SECRET_NAME" = var.argo_postgresql_secret_name
    "REQUEUE_TIME"                = var.requeue_time
    "ARCHIVE_TTL"                 = var.archive_ttl
    "INSTALL_CRDS"                = var.argo_install_crds
  }
  argo_service_account = "argo-workflows-${var.namespace}-service-account"
}

resource "helm_release" "argo" {
  name         = "argo-workflows-${var.namespace}"
  repository   = var.helm_repo_url
  chart        = var.helm_chart
  version      = var.helm_chart_version
  namespace    = var.namespace
  reset_values = true
  skip_crds    = true

  values = [
    templatefile("${path.module}/values.${var.argo_cloud_provider}.yaml", local.values_argo)
  ]
}
