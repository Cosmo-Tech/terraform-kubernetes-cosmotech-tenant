locals {
  values_argo = {
    "ARGO_SERVICE_ACCOUNT"        = local.argo_service_account
    "S3_ENDPOINT"                 = var.s3_endpoint
    "S3_BUCKET_NAME"              = var.s3_bucket_name
    "S3_CREDENTIALS_SECRET"       = var.s3_credentials_secret
    "S3_USERNAME_KEY"             = var.s3_username_key
    "S3_PASSWORD_KEY"             = var.s3_password_key
    "POSTGRES_RELEASE_NAME"       = var.postgres_release_name
    "ARGO_DATABASE"               = var.argo_database
    "ARGO_POSTGRESQL_USER"        = var.postgres_argo_user
    "ARGO_POSTGRESQL_SECRET_NAME" = var.argo_postgresql_secret_name
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

  values = [
    templatefile("${path.module}/values.yaml", local.values_argo)
  ]
}
