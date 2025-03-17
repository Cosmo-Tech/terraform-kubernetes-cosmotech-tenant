resource "kubernetes_persistent_volume_claim" "seaweedfs_master" {
  metadata {
    name      = "pvc-${var.pvc_seaweedfs_disk_master_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes       = [var.pvc_seaweedfs_storage_accessmode]
    storage_class_name = var.pvc_seaweedfs_storage_class_name
    resources {
      requests = {
        storage = var.pvc_seaweedfs_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_seaweedfs_disk_master_name}"
  }
}

resource "kubernetes_persistent_volume_claim" "seaweedfs_volume" {
  metadata {
    name      = "pvc-${var.pvc_seaweedfs_disk_volume_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes       = [var.pvc_seaweedfs_storage_accessmode]
    storage_class_name = var.pvc_seaweedfs_storage_class_name
    resources {
      requests = {
        storage = var.pvc_seaweedfs_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_seaweedfs_disk_volume_name}"
  }
}
