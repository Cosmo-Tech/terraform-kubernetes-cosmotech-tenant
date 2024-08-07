locals {
  values_minio = {
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "MINIO_RELEASE_NAME"          = local.instance_name
    "BUCKET_NAMES"                = "${var.argo_bucket_name}"
    "ARGO_MINIO_PERSISTENCE_SIZE" = var.argo_minio_persistence_size
    "ARGO_MINIO_REQUESTS_MEMORY"  = var.argo_minio_requests_memory
    "ARGO_MINIO_ACCESS_KEY"       = var.argo_minio_access_key
    "ARGO_MINIO_SECRET_KEY"       = var.argo_minio_secret_key
  }
}

locals {
  instance_name = "minio-${var.namespace}"
}

resource "helm_release" "minio" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.minio_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_minio)
  ]
}
