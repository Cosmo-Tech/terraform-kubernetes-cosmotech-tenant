locals {
  values_postgresql = {
    "POSTGRESQL_INITDB_SECRET"      = var.postgresql_initdb_secret_name
    "MONITORING_NAMESPACE"          = var.monitoring_namespace
    "POSTGRESQL_SECRET_NAME"        = var.postgresql_secret_name
    "POSTGRESQL_PASSWORD"           = data.kubernetes_secret.postgres_config.data.postgres-password
    "PERSISTENCE_SIZE"              = var.persistence_size
    "POSTGRESQL_EXISTING_PVC_NAME"  = var.postgresql_existing_pvc_name
    "POSTGRESQL_STORAGE_CLASS_NAME" = var.postgresql_pvc_storage_class_name
  }
  seaweedfs_username        = var.seaweedfs_username
  seaweedfs_password_secret = "${var.postgresql_secret_name}-seaweedfs"
  seaweedfs_database        = var.seaweedfs_database
}

data "kubernetes_secret" "postgres_config" {
  metadata {
    name      = "postgres-config"
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
