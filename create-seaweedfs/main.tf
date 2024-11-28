locals {
  chart_values = {
    "POSTGRESQL_HOST"     = var.postgresql_host
    "POSTGRESQL_PORT"     = var.postgresql_port
    "POSTGRESQL_DATABASE" = var.postgresql_database
    "POSTGRESQL_USERNAME" = var.postgresql_username
    "POSTGRESQL_SECRET"   = var.postgresql_password_secret
    "FILER_ENDPOINT"      = "http://${local.release_name}-filer.${var.namespace}.svc.cluster.local:8888"
    "S3_AUTH_SECRET"      = "${local.release_name}-s3-config"
    "S3_INIT_BUCKETS"     = ["argo-workflows", "grafana-loki"]
  }
  s3_config_values = {
    "ARGO_WORKFLOWS_USERNAME" = local.argo_workflows_username
    "ARGO_WORKFLOWS_PASSWORD" = random_password.argo_workflows_password.result
    "GRAFANA_LOKI_USERNAME"   = local.grafana_loki_username
    "GRAFANA_LOKI_PASSWORD"   = random_password.grafana_loki_password.result
  }
  release_name            = "seaweedfs-${var.namespace}"
  argo_workflows_username = "argo_workflows"
  grafana_loki_username   = "grafana_loki"
}

resource "helm_release" "seaweedfs" {
  name       = local.release_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "seaweedfs"
  version    = var.chart_version
  namespace  = var.namespace

  reset_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.chart_values)
  ]
}

resource "random_password" "argo_workflows_password" {
  length  = 30
  special = false
}

resource "random_password" "grafana_loki_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "s3_credentials" {
  metadata {
    name      = "${local.release_name}-s3-auth"
    namespace = var.namespace
    labels = {
      "app" = "seaweedfs"
    }
  }

  type = "Opaque"
  data = {
    "argo-workflows-username" = local.argo_workflows_username
    "argo-workflows-password" = random_password.argo_workflows_password.result
    "grafana-loki-username"   = local.grafana_loki_username
    "grafana-loki-password"   = random_password.grafana_loki_password.result
  }
}

resource "kubernetes_secret" "s3_auth_config" {
  metadata {
    name      = "${local.release_name}-s3-config"
    namespace = var.namespace
    labels = {
      "app" = "seaweedfs"
    }
  }

  type = "Opaque"
  data = {
    "config.json" = templatefile("${path.module}/s3_config.json", local.s3_config_values)
  }
}
