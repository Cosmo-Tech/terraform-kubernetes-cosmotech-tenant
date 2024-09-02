locals {
  local_network_client_secret  = var.azure_credentials_network_client_secret == "" ? data.kubernetes_secret.network_client_secret.data.password : var.azure_credentials_network_client_secret
  local_platform_client_secret = var.azure_credentials_platform_client_secret == "" ? data.kubernetes_secret.platform_client_secret.data.password : var.azure_credentials_platform_client_secret
  local_acr_login_password     = var.acr_password == "" ? data.kubernetes_secret.acr_login_password.data.password : var.acr_password
  local_storage_account_name   = var.azure_storage_account_key == "" ? data.kubernetes_secret.storage_account_password.data.password : var.azure_storage_account_key
  values_platform_config = {
    "cluster_name"                             = var.cluster_name
    "tenant_id"                                = var.azure_tenant_id
    "NAMESPACE"                                = var.kubernetes_tenant_namespace
    "API_VERSION"                              = var.api_version
    "ACR_SERVER"                               = var.acr_server
    "ACR_USERNAME"                             = var.acr_username
    "ACR_PASSWORD"                             = local.local_acr_login_password
    "ACR_REGISTRY_URL"                         = var.acr_registry_url
    "HOST_COSMOTECH_API"                       = var.host_cosmotech_api
    "IDENTITY_AUTHORIZATION_URL"               = var.identity_authorization_url
    "IDENTITY_TOKEN_URL"                       = var.identity_token_url
    "MONITORING_NAMESPACE"                     = var.monitoring_namespace
    "ARGO_SERVICE_ACCOUNT_NAME"                = var.argo_service_account_name
    "AZURE_TENANT_ID"                          = var.azure_tenant_id
    "AZURE_APPID_URI"                          = var.azure_appid_uri
    "AZURE_STORAGE_ACCOUNT_KEY"                = local.local_storage_account_name
    "AZURE_STORAGE_ACCOUNT_NAME"               = var.azure_storage_account_name
    "AZURE_CREDENTIALS_CLIENT_ID"              = var.azure_credentials_platform_client_id
    "AZURE_CREDENTIALS_CLIENT_SECRET"          = local.local_platform_client_secret
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_ID"     = var.azure_credentials_network_client_id
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_SECRET" = local.local_network_client_secret
    "ADX_BASE_URI"                             = var.adx_base_uri
    "ADX_INGEST_URI"                           = var.adx_ingest_uri
    "EVENTBUS_BASEURI"                         = var.eventbus_base_uri
    "HOST_POSTGRES"                            = var.host_postgres
    "HOST_REDIS"                               = var.host_redis
    "HOST_REDIS_PASSWORD"                      = var.host_redis_password
    "HOST_ARGO_WORKFLOWS_SERVER"               = var.host_argo_workflow
    "RDS_HUB_LISTENER"                         = var.rds_hub_listener
    "RDS_HUB_SENDER"                           = var.rds_hub_sender
    "RDS_STORAGE_ADMIN"                        = var.rds_storage_admin
    "RDS_STORAGE_READER"                       = var.rds_storage_reader
    "RDS_STORAGE_WRITER"                       = var.rds_storage_writer
    "HOST_RDS"                                 = var.host_rds
    "HOST_RDS_POSTGRES"                        = var.host_rds_postgres
  }
}

data "kubernetes_secret" "network_client_secret" {
  metadata {
    name      = "network-client-secret"
    namespace = "default"
  }
}

data "kubernetes_secret" "platform_client_secret" {
  metadata {
    name      = "platform-client-secret"
    namespace = var.kubernetes_tenant_namespace
  }
}

data "kubernetes_secret" "storage_account_password" {
  metadata {
    name      = "storage-account-secret"
    namespace = var.kubernetes_tenant_namespace
  }
}

data "kubernetes_secret" "acr_login_password" {
  metadata {
    name      = "acr-admin-secret"
    namespace = var.kubernetes_tenant_namespace
  }
}

resource "kubernetes_config_map" "platform_secret_script" {
  metadata {
    name      = "platform-config-script-${var.kubernetes_tenant_namespace}"
    namespace = var.vault_namespace
  }

  data = {
    "platform_secret.sh" = templatefile("${path.module}/templates/config.sh.tpl", local.values_platform_config)
  }
}

resource "kubernetes_job" "platform_secret_config" {
  metadata {
    name      = "platform-config-job-${var.kubernetes_tenant_namespace}"
    namespace = var.vault_namespace
  }

  spec {
    template {
      metadata {
        name = "platform-config"
      }

      spec {
        restart_policy       = "Never"
        service_account_name = "vault-unseal"
        container {
          name    = "platform-config"
          image   = "bitnami/kubectl:latest"
          command = ["/bin/bash", "-c", "bash /scripts/platform_secret.sh"]

          env {
            name  = "VAULT_ADDR"
            value = var.vault_address
          }

          env {
            name  = "VAULT_NAMESPACE"
            value = var.vault_namespace
          }

          volume_mount {
            name       = "config"
            mount_path = "/scripts"
          }
        }

        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map.platform_secret_script.metadata[0].name
          }
        }
      }
    }

    backoff_limit = 4
  }

  wait_for_completion = true
  timeouts {
    create = "5m"
    update = "5m"
  }

  depends_on = [
    kubernetes_config_map.platform_secret_script
  ]
}
