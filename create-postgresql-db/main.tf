locals {
  values_postgresql = {
    "POSTGRESQL_INITDB_SECRET"      = var.postgresql_initdb_secret_name
    "MONITORING_NAMESPACE"          = var.monitoring_namespace
    "POSTGRESQL_SECRET_NAME"        = var.postgresql_secret_name
    "POSTGRESQL_PASSWORD"           = data.kubernetes_secret.postgres_config.data.postgres-password
    "PERSISTENCE_SIZE"              = var.persistence_size
    "POSTGRESQL_EXISTING_PVC_NAME"  = "${var.postgresql_existing_pvc_name}-${var.namespace}"
    "POSTGRESQL_STORAGE_CLASS_NAME" = var.postgresql_pvc_storage_class_name
  }
  seaweedfs_username        = data.kubernetes_secret.seaweedfs_postgres_config.data.postgresql-username
  seaweedfs_password_secret = data.kubernetes_secret.seaweedfs_postgres_config.data.postgresql-password
  seaweedfs_database        = var.seaweedfs_database
}

data "kubernetes_secret" "seaweedfs_postgres_config" {
  metadata {
    name = "postgres-config-seaweedfs"
    namespace = var.namespace
  }
}

data "kubernetes_secret" "postgres_config" {
  metadata {
    name = "postgres-config"
    namespace = var.namespace
  }
}

resource "helm_release" "postgresql" {
  name       = "postgresql-${var.namespace}"
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.postgresql_version
  namespace  = var.namespace

  reset_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_postgresql)
  ]
}