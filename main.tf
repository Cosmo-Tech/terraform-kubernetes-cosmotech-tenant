locals {
  tls_secret_name    = var.tls_certificate_type != "none" ? var.tls_secret_name : ""
  minio_release_name = "minio"
  use_minio_storage  = startswith(var.cosmotech_api_version, "2.") || startswith(var.cosmotech_api_version, "3.")
}

resource "kubernetes_namespace" "main_namespace" {
  metadata {
    name = var.kubernetes_tenant_namespace
  }
}

resource "random_password" "redis_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_secret_key" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_access_key" {
  length  = 30
  special = false
}
