locals {
  disk_name  = "disk-postgres-tenant-${var.kubernetes_tenant_namespace}"
}

resource "kubernetes_persistent_volume_claim" "postgres_master" {
  metadata {
    name      = "pvc-${local.disk_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = var.pvc_postgres_storage_class_name
    resources {
      requests = {
        storage = "${var.pvc_postgres_storage_gbi}Gi"
      }
    }
    volume_name = "pv-${local.disk_name}"
  }
}