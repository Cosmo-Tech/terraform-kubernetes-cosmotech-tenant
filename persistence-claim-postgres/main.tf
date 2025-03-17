resource "kubernetes_persistent_volume_claim" "postgres_master" {
  metadata {
    name      = "pvc-${var.pvc_postgres_disk_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = [var.pvc_postgres_storage_accessmode]
    storage_class_name = var.pvc_postgres_storage_class_name
    resources {
      requests = {
        storage = var.pvc_postgres_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_postgres_disk_name}"
  }
}