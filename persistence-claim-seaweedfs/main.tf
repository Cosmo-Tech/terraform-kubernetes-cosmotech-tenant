locals {
  disk_master_name  = "disk-seaweedfs-tenant-${var.kubernetes_tenant_namespace}-master"
  disk_volume_name  = "disk-seaweedfs-tenant-${var.kubernetes_tenant_namespace}-volume"
}

resource "kubernetes_persistent_volume_claim" "seaweedfs_master" {
  metadata {
    name      = "pvc-${local.disk_master_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = var.pvc_seaweedfs_storage_class_name
    resources {
      requests = {
        storage = var.pvc_seaweedfs_storage_gbi
      }
    }
    volume_name = "pv-${local.disk_master_name}"
  }
}

resource "kubernetes_persistent_volume_claim" "seaweedfs_volume" {
  metadata {
    name      = "pvc-${local.disk_volume_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = var.pvc_seaweedfs_storage_class_name
    resources {
      requests = {
        storage = var.pvc_seaweedfs_storage_gbi
      }
    }
    volume_name = "pv-${local.disk_volume_name}"
  }
}