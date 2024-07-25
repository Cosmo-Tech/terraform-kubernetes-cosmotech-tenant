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
    "PLATFORM_SECRETS_NAME"  = base64encode(local.platform_secrets_name)
    "NAMESPACE"              = base64encode(var.namespace)
    "API_VERSION"            = base64encode(var.api_version)
    "ACR_SERVER"             = base64encode(var.acr_server)
    "ACR_USERNAME"           = base64encode(var.acr_username)
    "ACR_PASSWORD"           = base64encode(var.acr_password)
    "ACR_REGISTRY_URL"       = base64encode("https://${var.acr_server}")
    "HOST_COSMOTECH_API"     = base64encode(var.host_cosmotech_api)
    "IDENTITY_AUTHORIZATION_URL" = base64encode("https://login.microsoftonline.com/${var.azure_tenant_id}/oauth2/v2.0/authorize")
    "IDENTITY_TOKEN_URL"     = base64encode("https://login.microsoftonline.com/${var.azure_tenant_id}/oauth2/v2.0/token")
    "MONITORING_NAMESPACE"   = base64encode(var.monitoring_namespace)
    "ARGO_SERVICE_ACCOUNT_NAME"  = base64encode(var.argo_service_account_name)
    "AZURE_TENANT_ID"        = base64encode(var.azure_tenant_id)
    "AZURE_APPID_URI"        = base64encode(var.azure_appid_uri)
    "AZURE_STORAGE_ACCOUNT_KEY" = base64encode(var.azure_storage_account_key)
    "AZURE_STORAGE_ACCOUNT_NAME" = base64encode(var.azure_storage_account_name)
    "AZURE_CREDENTIALS_CLIENT_ID" = base64encode(var.azure_credentials_client_id)
    "AZURE_CREDENTIALS_CLIENT_SECRET" = base64encode(var.azure_credentials_client_secret)
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_ID" = base64encode(var.azure_credentials_customer_client_id)
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_SECRET" = base64encode(var.azure_credentials_customer_client_secret)
    "ADX_BASE_URI"           = base64encode(var.adx_base_uri)
    "ADX_INGEST_URI"         = base64encode(var.adx_ingest_uri)
    "EVENTBUS_BASEURI"       = base64encode(var.eventbus_base_uri)
    "HOST_POSTGRES"          = base64encode("${var.postgres_release_name}.${var.namespace}.svc.cluster.local")
    "HOST_REDIS"             = base64encode("cosmotechredis-${var.namespace}-master.${var.namespace}.svc.cluster.local")
    "HOST_REDIS_PASSWORD"    = base64encode(var.host_redis_password)
    "HOST_ARGO_WORKFLOWS_SERVER"  = base64encode("http://${var.argo_release_name}-server.${var.namespace}.svc.cluster.local:2746")
    "RDS_HUB_LISTENER"            = base64encode(var.rds_hub_listener)
    "RDS_HUB_SENDER"              = base64encode(var.rds_hub_sender)
    "RDS_STORAGE_ADMIN"           = base64encode(var.rds_storage_admin)
    "RDS_STORAGE_READER"          = base64encode(var.rds_storage_reader)
    "RDS_STORAGE_WRITER"          = base64encode(var.rds_storage_writer)
    "HOST_RDS"                    = base64encode(var.host_rds)
    "HOST_RDS_POSTGRES"           = base64encode(var.host_rds_postgres)
    "SPRING_APPLICATION_JSON"     = base64encode("{ \"csm\":{ \"platform\":{ \"identityProvider\":{ \"defaultScopes\":{ \"[api://${var.azure_appid_uri}/.default]\":\"${var.namespace} scope\" }, \"containerScopes\":{ \"[api://${var.azure_appid_uri}/platform]\":\"${var.namespace} scope\" } } } } }")
  }
  platform_secrets_name = "${var.namespace}-platform-secrets"
}

resource "kubectl_manifest" "secret" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-secret.yaml", local.values_platform_config)
}