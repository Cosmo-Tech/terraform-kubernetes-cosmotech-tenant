locals {
  values_redis = {
    "REDIS_PASSWORD"          = var.redis_admin_password
    "VERSION_REDIS_COSMOTECH" = var.version_redis_cosmotech
    "REDIS_MASTER_NAME_PVC"   = local.redis_pvc_name
    "REDIS_DISK_SIZE"         = var.redis_pv_capacity
    "REDIS_REPLICA_NAME_PVC"  = var.is_bare_metal ? local.redis_replica_name_pvc : ""
  }
}

locals {
  instance_name          = "${var.helm_release_name}-${var.namespace}"
  redis_pv_name          = "${local.instance_name}-pv"
  redis_pvc_name         = "${local.instance_name}-pvc"
  redis_replica_name_pv  = "${local.instance_name}-replica-pv"
  redis_replica_name_pvc = "${local.instance_name}-replica-pvc"
}

resource "kubernetes_persistent_volume_v1" "redis-pv" {
  metadata {
    name = local.redis_pv_name
    labels = {
      "cosmotech.com/service" = "redis"
    }
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    claim_ref {
      name      = local.redis_pvc_name
      namespace = var.namespace
    }
    capacity = {
      storage = var.redis_pv_capacity
    }
    persistent_volume_source {
      dynamic "local" {
        for_each = var.is_bare_metal ? [true] : []
        content {
          path = "/mnt/redis-storage"
        }
      }
      dynamic "azure_disk" {
        for_each = var.is_bare_metal ? [] : [true]
        content {
          caching_mode  = "ReadWrite"
          data_disk_uri = var.managed_disk_id
          disk_name     = var.redis_disk_name
          kind          = "Managed"
        }
      }
    }
    persistent_volume_reclaim_policy = "Retain"

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "cosmotech.com/tier"
            operator = "In"
            values   = ["db"]
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "redis-pvc" {
  metadata {
    name      = local.redis_pvc_name
    namespace = var.namespace
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.redis_pv_capacity
      }
    }
    volume_name = local.redis_pv_name
  }
}

resource "kubernetes_persistent_volume_v1" "redis-pv-replica" {
  count = var.is_bare_metal ? 1 : 0
  metadata {
    name = local.redis_replica_name_pv
    labels = {
      "cosmotech.com/service" = "redis"
    }
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    claim_ref {
      name      = local.redis_replica_name_pvc
      namespace = var.namespace
    }
    capacity = {
      storage = var.redis_pv_capacity
    }
    persistent_volume_source {

      local {
        path = "/mnt/redis-replica-storage"
      }
    }
    persistent_volume_reclaim_policy = "Retain"

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "cosmotech.com/tier"
            operator = "In"
            values   = ["db"]
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "redis-pvc-replica" {
  count = var.is_bare_metal ? 1 : 0
  metadata {
    name      = local.redis_replica_name_pvc
    namespace = var.namespace
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.redis_pv_capacity
      }
    }
    volume_name = local.redis_replica_name_pv
  }
}

resource "helm_release" "cosmotechredis" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  version    = var.chart_redis_version
  namespace  = var.namespace

  reuse_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_redis)
  ]

  depends_on = [
    kubernetes_persistent_volume_v1.redis-pv,
    kubernetes_persistent_volume_claim_v1.redis-pvc,
    kubernetes_persistent_volume_v1.redis-pv-replica,
    kubernetes_persistent_volume_claim_v1.redis-pvc-replica
  ]
}