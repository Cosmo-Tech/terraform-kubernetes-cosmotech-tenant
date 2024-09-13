locals {
  local_rabbitmq_admin_password    = var.create_rabbitmq_secret ? random_password.rabbitmq_admin_password.result : data.kubernetes_secret.rabbitmq_data.data.admin
  local_rabbitmq_listener_password = var.create_rabbitmq_secret ? random_password.rabbitmq_listener_password.result : data.kubernetes_secret.rabbitmq_data.data.listener
  local_rabbitmq_sender_password   = var.create_rabbitmq_secret ? random_password.rabbitmq_sender_password.result : data.kubernetes_secret.rabbitmq_data.data.sender

  values_rabbitmq = {
    "MONITORING_NAMESPACE" = var.monitoring_namespace
    "INSTANCE_NAME"        = local.instance_name
    "ADMIN_PASSWORD"       = local.local_rabbitmq_admin_password
    "SENDER_USERNAME"      = var.rabbitmq_sender_username
    "SENDER_PASSWORD"      = local.local_rabbitmq_sender_password
    "LISTENER_USERNAME"    = var.rabbitmq_listener_username
    "LISTENER_PASSWORD"    = local.local_rabbitmq_listener_password
    "PERSISTENCE_SIZE"     = var.persistence_size
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
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

data "kubernetes_secret" "rabbitmq_data" {
  count = var.create_rabbitmq_secret ? 0 : 1
  metadata {
    name      = "rabbitmq-data-secret"
    namespace = var.namespace
  }
}

resource "kubernetes_secret" "rabbitmq-secret" {
  count = var.create_rabbitmq_secret ? 1 : 0
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
