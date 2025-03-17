resource "kubernetes_persistent_volume_claim" "minio_master" {
  metadata {
    name      = "pvc-${var.pvc_minio_disk_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes       = [var.pvc_minio_storage_accessmode]
    storage_class_name = var.pvc_minio_storage_class_name
    resources {
      requests = {
        storage = var.pvc_minio_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_minio_disk_name}"
  }
}
