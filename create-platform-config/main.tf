terraform {
  required_providers {
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
  }
}

locals {
  values_platform_config = {
    "PLATFORM_SECRETS_NAME"                    = local.platform_secrets_name
    "NAMESPACE"                                = var.namespace
    "API_VERSION"                              = var.api_version
    "ACR_SERVER"                               = var.acr_server
    "ACR_USERNAME"                             = var.acr_username
    "ACR_PASSWORD"                             = var.acr_password
    "ACR_REGISTRY_URL"                         = "https://${var.acr_server}"
    "HOST_COSMOTECH_API"                       = var.host_cosmotech_api
    "IDENTITY_AUTHORIZATION_URL"               = "https://login.microsoftonline.com/${var.azure_tenant_id}/oauth2/v2.0/authorize"
    "IDENTITY_TOKEN_URL"                       = "https://login.microsoftonline.com/${var.azure_tenant_id}/oauth2/v2.0/token"
    "MONITORING_NAMESPACE"                     = var.monitoring_namespace
    "ARGO_SERVICE_ACCOUNT_NAME"                = var.argo_service_account_name
    "AZURE_TENANT_ID"                          = var.azure_tenant_id
    "AZURE_APPID_URI"                          = var.azure_appid_uri
    "AZURE_STORAGE_ACCOUNT_KEY"                = var.azure_storage_account_key
    "AZURE_STORAGE_ACCOUNT_NAME"               = var.azure_storage_account_name
    "AZURE_CREDENTIALS_CLIENT_ID"              = var.azure_platform_credentials_client_id
    "AZURE_CREDENTIALS_CLIENT_SECRET"          = var.azure_platform_credentials_client_secret
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_ID"     = var.azure_credentials_network_client_id
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_SECRET" = var.azure_credentials_network_client_secret
    "ADX_BASE_URI"                             = var.adx_base_uri
    "ADX_INGEST_URI"                           = var.adx_ingest_uri
    "EVENTBUS_BASEURI"                         = var.eventbus_base_uri
    "HOST_POSTGRES"                            = "${var.postgres_release_name}.${var.namespace}.svc.cluster.local"
    "HOST_REDIS"                               = "cosmotechredis-${var.namespace}-master.${var.namespace}.svc.cluster.local"
    "HOST_REDIS_PASSWORD"                      = var.host_redis_password
    "HOST_ARGO_WORKFLOWS_SERVER"               = "http://${var.argo_release_name}-server.${var.namespace}.svc.cluster.local:2746"
    "RDS_HUB_LISTENER"                         = var.rds_hub_listener
    "RDS_HUB_SENDER"                           = var.rds_hub_sender
    "RDS_STORAGE_ADMIN"                        = var.rds_storage_admin
    "RDS_STORAGE_READER"                       = var.rds_storage_reader
    "RDS_STORAGE_WRITER"                       = var.rds_storage_writer
    "HOST_RDS"                                 = var.host_rds
    "HOST_RDS_POSTGRES"                        = var.host_rds_postgres
    "SPRING_APPLICATION_JSON"                  = "{ \"csm\":{ \"platform\":{ \"identityProvider\":{ \"defaultScopes\":{ \"[api://${var.azure_appid_uri}/.default]\":\"${var.namespace} scope\" }, \"containerScopes\":{ \"[api://${var.azure_appid_uri}/platform]\":\"${var.namespace} scope\" } } } } }"
  }
  platform_secrets_name = "${var.namespace}-platform-secrets"
}

resource "kubernetes_secret" "platform_config_secret" {
  metadata {
    name      = "${var.namespace}-platform-secret"
    namespace = var.namespace
  }
  type = "Opaque"
  data = local.values_platform_config
}
