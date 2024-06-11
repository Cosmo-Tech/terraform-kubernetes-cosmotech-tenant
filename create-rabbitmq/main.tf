locals {
  values_rabbitmq = {
    "MONITORING_NAMESPACE" = var.monitoring_namespace
    "INSTANCE_NAME"        = local.instance_name
    "ADMIN_PASSWORD"       = random_password.rabbitmq_admin_password.result
    "SENDER_USERNAME"      = var.rabbitmq_sender_username
    "SENDER_PASSWORD"      = random_password.rabbitmq_sender_password.result
    "LISTENER_USERNAME"    = var.rabbitmq_listener_username
    "LISTENER_PASSWORD"    = random_password.rabbitmq_listener_password.result
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
