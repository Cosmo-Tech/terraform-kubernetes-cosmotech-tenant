locals {
  values_redis = {
    "REDIS_PASSWORD"          = var.redis_admin_password
    "VERSION_REDIS_COSMOTECH" = var.version_redis_cosmotech
    "REDIS_MASTER_NAME_PVC"   = local.redis_pvc_name
    "REDIS_DISK_SIZE"         = var.redis_pv_capacity
    "REDIS_REPLICA_NAME_PVC"  = local.redis_replica_name_pvc
  }
}

locals {
  instance_name          = "${var.helm_release_name}-${var.namespace}"
  redis_pv_name          = "${var.redis_pv_name}-${var.namespace}"
  redis_pvc_name         = "${var.redis_pvc_name}-${var.namespace}"
  redis_replica_name_pv  = "${var.redis_pv_name}-replica-${var.namespace}"
  redis_replica_name_pvc = "${var.redis_pvc_name}-replica-${var.namespace}"
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

      local {
        path = "/mnt/redis-storage"
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
  version    = var.redis_version
  namespace  = var.namespace

  reuse_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_redis)
  ]

  depends_on = [
    kubernetes_persistent_volume_v1.redis-pv, kubernetes_persistent_volume_claim_v1.redis-pvc, kubernetes_persistent_volume_v1.redis-pv-replica, kubernetes_persistent_volume_claim_v1.redis-pvc-replica
  ]
}