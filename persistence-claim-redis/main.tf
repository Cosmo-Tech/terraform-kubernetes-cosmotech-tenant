locals {
  disk_master_name  = "disk-redis-master-tenant-${var.kubernetes_tenant_namespace}"
  disk_replica_name = "disk-redis-replica-tenant-${var.kubernetes_tenant_namespace}"
}

resource "kubernetes_persistent_volume_claim" "redis_master" {
  metadata {
    name      = "pvc-${local.disk_master_name}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "${var.pvc_redis_storage_gbi}Gi"
      }
    }
    volume_name = "pv-${local.disk_master_name}"
  }
}

resource "kubernetes_persistent_volume_claim" "redis_replicas" {
  count = var.pvc_redis_replicas
  metadata {
    name      = "pvc-${local.disk_replica_name}-${count.index}"
    namespace = var.kubernetes_tenant_namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "${var.pvc_redis_storage_gbi}Gi"
      }
    }
    volume_name = "pv-${local.disk_replica_name}-${count.index}"
  }
}