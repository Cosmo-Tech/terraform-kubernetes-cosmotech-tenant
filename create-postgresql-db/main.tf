locals {
  values_postgresql = {
    "POSTGRESQL_INITDB_SECRET" = var.postgresql_initdb_secret_name
    "MONITORING_NAMESPACE"     = var.monitoring_namespace
    "POSTGRESQL_SECRET_NAME"   = var.postgresql_secret_name
    "POSTGRESQL_PASSWORD"      = random_password.postgres_postgresql_password.result
    "PERSISTENCE_SIZE"         = var.persistence_size
  }
  initdb_data = {
    "COSMOTECH_API_READER_USERNAME" = var.cosmotech_api_reader_username
    "COSMOTECH_API_READER_PASSWORD" = random_password.postgresql_reader_password.result
    "COSMOTECH_API_WRITER_USERNAME" = var.cosmotech_api_writer_username
    "COSMOTECH_API_WRITER_PASSWORD" = random_password.postgresql_writer_password.result
    "COSMOTECH_API_ADMIN_USERNAME"  = var.cosmotech_api_admin_username
    "COSMOTECH_API_ADMIN_PASSWORD"  = random_password.postgresql_admin_password.result
    "ARGO_POSTGRESQL_USER"          = var.argo_postgresql_user
    "ARGO_POSTGRESQL_PASSWORD"      = random_password.argo_postgresql_password.result
    "ARGO_DATABASE"                 = var.argo_database
    "SEAWEEDFS_USERNAME"            = local.seaweedfs_username
    "SEAWEEDFS_PASSWORD"            = random_password.seaweedfs_postgresql_password.result
    "SEAWEEDFS_DATABASE"            = local.seaweedfs_database
  }

  seaweedfs_username        = "seaweedfs"
  seaweedfs_password_secret = "${var.postgresql_secret_name}-seaweedfs"
  seaweedfs_database        = "seaweedfs"
}

resource "helm_release" "postgresql" {
  name       = "postgresql-${var.namespace}"
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.postgresql_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_postgresql)
  ]
}

resource "random_password" "postgresql_reader_password" {
  length  = 30
  special = false
}

resource "random_password" "postgresql_writer_password" {
  length  = 30
  special = false
}

resource "random_password" "postgresql_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "postgres_postgresql_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_postgresql_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "postgresql-initdb" {
  count = var.create_secrets_config ? 1 : 0
  metadata {
    name      = var.postgresql_initdb_secret_name
    namespace = var.namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    "initdb.sql" = templatefile("${path.module}/initdb.sql", local.initdb_data)
  }

  type = "Opaque"

}

resource "kubernetes_secret" "postgres-config" {
  count = var.create_secrets_config ? 1 : 0
  metadata {
    name      = var.postgresql_secret_name
    namespace = var.namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    argo-username                 = var.argo_postgresql_user
    database-password             = random_password.argo_postgresql_password.result
    argo-password                 = random_password.argo_postgresql_password.result
    postgres-username             = "postgres"
    postgres-password             = random_password.postgres_postgresql_password.result
    cosmotech-api-admin-username  = var.cosmotech_api_admin_username
    cosmotech-api-admin-password  = random_password.postgresql_admin_password.result
    cosmotech-api-reader-username = var.cosmotech_api_reader_username
    cosmotech-api-reader-password = random_password.postgresql_reader_password.result
    cosmotech-api-writer-username = var.cosmotech_api_writer_username
    cosmotech-api-writer-password = random_password.postgresql_writer_password.result
  }

  type = "Opaque"
}

resource "random_password" "seaweedfs_postgresql_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "postgres-seaweedfs-config" {
  metadata {
    name      = local.seaweedfs_password_secret
    namespace = var.namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    postgresql-username = local.seaweedfs_username
    postgresql-password = random_password.seaweedfs_postgresql_password.result
  }

  type = "Opaque"
}
