locals {
  values_rabbitmq = {
    "MONITORING_NAMESPACE" = var.monitoring_namespace
    "INSTANCE_NAME"        = local.instance_name
    "ADMIN_PASSWORD"       = random_password.rabbitmq_admin_password.result
    "SENDER_USERNAME"      = var.rabbitmq_sender_username
    "SENDER_PASSWORD"      = random_password.rabbitmq_sender_password.result
    "LISTENER_USERNAME"    = var.rabbitmq_listener_username
    "LISTENER_PASSWORD"    = random_password.rabbitmq_listener_password.result
    "RABBITMQ_PVC_NAME"    = local.pvc_name
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
  pv_name       = "${var.helm_release_name}-pv"
  pvc_name      = "${var.helm_release_name}-pvc"
}


resource "kubernetes_persistent_volume_v1" "rabbitmq-pv" {
  metadata {
    name = local.pv_name
    labels = {
      "cosmotech.com/service" = "rabbitmq"
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
      storage = "8Gi"
    }
    persistent_volume_source {

      local {
        path = "/mnt/rabbitmq-storage"
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

resource "kubernetes_persistent_volume_claim_v1" "rabbitmq-pvc" {
  metadata {
    name      = local.pvc_name
    namespace = var.namespace
  }
  spec {
    storage_class_name = ""
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
    volume_name = local.pv_name
  }
}

resource "helm_release" "rabbitmq" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.helm_chart_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_rabbitmq)
  ]

  depends_on = [kubernetes_persistent_volume_v1.rabbitmq-pv, kubernetes_persistent_volume_claim_v1.rabbitmq-pvc]
}

resource "random_password" "rabbitmq_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "rabbitmq_listener_password" {
  length  = 30
  special = false
}

resource "random_password" "rabbitmq_sender_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "rabbitmq-secret" {
  metadata {
    name      = "${local.instance_name}-secret"
    namespace = var.namespace
    labels = {
      "app" = "rabbitmq"
    }
  }

  data = {
    admin-username    = "admin"
    admin-password    = random_password.rabbitmq_admin_password.result
    listener-username = var.rabbitmq_listener_username
    listener-password = random_password.rabbitmq_listener_password.result
    sender-username   = var.rabbitmq_sender_username
    sender-password   = random_password.rabbitmq_sender_password.result
  }

  type = "Opaque"
}
