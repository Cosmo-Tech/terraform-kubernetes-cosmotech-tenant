locals {
  tls_secret_name         = var.tls_certificate_type != "none" ? var.tls_secret_name : ""
  use_minio_storage       = startswith(var.cosmotech_api_version, "2.") || startswith(var.cosmotech_api_version, "3.")
  use_old_redis           = startswith(var.cosmotech_api_version, "2.") || startswith(var.cosmotech_api_version, "3.0") || startswith(var.cosmotech_api_version, "3.1")
  version_redis_cosmotech = local.use_old_redis ? "1.0.8" : "1.0.12"
}

resource "kubernetes_namespace" "main_namespace" {
  metadata {
    name = var.kubernetes_tenant_namespace
    labels = {
      "pod-security.kubernetes.io/enforce"         = "restricted"
      "pod-security.kubernetes.io/enforce-version" = "latest"
    }
  }
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [kubernetes_namespace.main_namespace]

  destroy_duration = "30s"
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
