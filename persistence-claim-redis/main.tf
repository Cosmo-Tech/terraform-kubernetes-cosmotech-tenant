resource "kubernetes_persistent_volume_claim" "redis_master" {
  metadata {
    name      = "pvc-${var.pvc_redis_disk_master_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes       = [var.pvc_redis_storage_accessmode]
    storage_class_name = var.pvc_redis_storage_class_name
    resources {
      requests = {
        storage = var.pvc_redis_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_redis_disk_master_name}"
  }
}

resource "kubernetes_persistent_volume_claim" "redis_replicas" {
  count = var.pvc_redis_replicas
  metadata {
    name      = "pvc-${var.pvc_redis_disk_replica_name}-${count.index}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes       = [var.pvc_redis_storage_accessmode]
    storage_class_name = var.pvc_redis_storage_class_name
    resources {
      requests = {
        storage = var.pvc_redis_storage_gbi
      }
    }
    volume_name = "pv-${var.pvc_redis_disk_replica_name}-${count.index}"
  }
}
