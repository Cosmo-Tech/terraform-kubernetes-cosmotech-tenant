locals {
  local_argo_minio_secret_key = var.argo_minio_secret_key == "" ? random_password.argo_minio_secret_key.result : var.argo_minio_secret_key
  local_argo_minio_access_key = var.argo_minio_access_key == "" ? random_password.argo_minio_access_key.result : var.argo_minio_access_key
  values_minio = {
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "MINIO_RELEASE_NAME"          = local.instance_name
    "BUCKET_NAMES"                = "${var.argo_bucket_name}"
    "ARGO_MINIO_PERSISTENCE_SIZE" = var.argo_minio_persistence_size
    "ARGO_MINIO_REQUESTS_MEMORY"  = var.argo_minio_requests_memory
    "ARGO_MINIO_ACCESS_KEY"       = local.local_argo_minio_access_key
    "ARGO_MINIO_SECRET_KEY"       = local.local_argo_minio_secret_key
    "MINIO_EXISTING_PVC_NAME"     = "${var.minio_existing_pvc_name}-${var.namespace}"
    "MINIO_STORAGE_CLASS_NAME"    = var.minio_storage_class_name
  }
}

locals {
  instance_name = "minio-${var.namespace}"
}

resource "random_password" "argo_minio_secret_key" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_access_key" {
  length  = 30
  special = false
}

resource "helm_release" "minio" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.minio_version
  namespace  = var.namespace

  reset_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_minio)
  ]
}
