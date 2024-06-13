locals {
  values_minio = {
    "MONITORING_NAMESPACE"        = var.monitoring_namespace
    "MINIO_RELEASE_NAME"          = local.instance_name
    "BUCKET_NAMES"                = "${var.argo_bucket_name},${var.cosmotechapi_bucket_name}"
    "ARGO_MINIO_PERSISTENCE_SIZE" = var.argo_minio_persistence_size
    "ARGO_MINIO_REQUESTS_MEMORY"  = var.argo_minio_requests_memory
    "ARGO_MINIO_ACCESS_KEY"       = var.argo_minio_access_key
    "ARGO_MINIO_SECRET_KEY"       = var.argo_minio_secret_key
    "MINIO_PVC_NAME"              = local.pvc_name
  }
}

locals {
  instance_name = "${var.minio_release_name}-${var.namespace}"
  pv_name       = "${var.minio_release_name}-pv"
  pvc_name      = "${var.minio_release_name}-pvc"
}

resource "kubernetes_persistent_volume_v1" "minio-pv" {
  metadata {
    name = local.pv_name
    labels = {
      "cosmotech.com/service" = "minio"
    }
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    claim_ref {
      name      = local.pvc_name
      namespace = var.namespace
    }
    capacity = {
      storage = var.argo_minio_persistence_size
    }
    persistent_volume_source {

      local {
        path = "/mnt/minio-storage"
      }
    }
    persistent_volume_reclaim_policy = "Retain"

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "cosmotech.com/tier"
            operator = "In"
            values   = ["services"]
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "minio-pvc" {
  metadata {
    name      = local.pvc_name
    namespace = var.namespace
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.argo_minio_persistence_size
      }
    }
    volume_name = local.pv_name
  }
}

resource "helm_release" "minio" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.minio_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_minio)
  ]

  depends_on = [
    kubernetes_persistent_volume_claim_v1.minio-pvc,
    kubernetes_persistent_volume_v1.minio-pv
  ]
}
