locals {
  values_postgresql = {
    "POSTGRESQL_INITDB_SECRET" = var.postgresql_initdb_secret_name
    "MONITORING_NAMESPACE"     = var.monitoring_namespace
    "POSTGRESQL_SECRET_NAME"   = var.postgresql_secret_name
    "POSTGRESQL_PASSWORD"      = random_password.postgres_postgresql_password.result
    "POSTGRESQL_PVC_NAME"      = local.pvc_name
    "POSTGRESQL_STORAGE_CLASS" = var.provisioner == "local-path" ? "-" : var.provisioner
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
    "ARGO_DATABSE"                  = var.argo_database
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
  pv_name       = "${var.helm_release_name}-pv"
  pvc_name      = "${var.helm_release_name}-pvc"
}

resource "kubernetes_persistent_volume_v1" "postgres-pv" {
  count = var.is_bare_metal && var.provisioner == "local-path" ? 1 : 0
  metadata {
    name = local.pv_name
    labels = {
      "cosmotech.com/db" = "postgres"
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
        path = "/mnt/postgres-storage"
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

resource "kubernetes_persistent_volume_claim_v1" "postgres-pvc" {
  count = var.is_bare_metal && var.provisioner == "local-path" ? 1 : 0
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

resource "helm_release" "postgresql" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart
  version    = var.postgresql_version
  namespace  = var.namespace

  reuse_values = true

  values = [
    templatefile("${path.module}/values.yaml", local.values_postgresql)
  ]

  depends_on = [kubernetes_persistent_volume_v1.postgres-pv, kubernetes_persistent_volume_claim_v1.postgres-pvc]
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

resource "kubernetes_secret" "postgresql-initdb" {
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

resource "random_password" "postgres_postgresql_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_postgresql_password" {
  length  = 30
  special = false
}

resource "kubernetes_secret" "postgres-config" {
  metadata {
    name      = var.postgresql_secret_name
    namespace = var.namespace
    labels = {
      "app" = "postgres"
    }
  }

  data = {
    argo-username                 = var.argo_postgresql_user
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
