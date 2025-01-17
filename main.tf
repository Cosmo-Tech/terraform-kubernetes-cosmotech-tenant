locals {
  tls_secret_name = var.tls_certificate_type != "none" ? var.custom_tls_secret_name : var.cert_tls_secret_name
  minio_endpoint  = var.use_minio_storage ? "${module.create-minio.0.out_minio_release_name}.${var.kubernetes_tenant_namespace}.svc.cluster.local:9000" : ""
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
