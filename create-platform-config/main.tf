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
    "PLATFORM_SECRETS_NAME"  = local.platform_secrets_name
    "NAMESPACE"              = var.namespace
    "API_VERSION"            =
    "ACR_SERVER"             =
    "ACR_USERNAME"           =
    "ACR_PASSWORD"           =
    "ACR_REGISTRY_URL"       =
    "HOST_COSMOTECH_API"     =
    "IDENTITY_AUTHORIZATION_URL" =
    "IDENTITY_TOKEN_URL"     =
    "MONITORING_NAMESPACE"   =
    "NAMESPACE"              =    
    "ARGO_SERVICE_ACCOUNT_NAME"  =
    "AZURE_TENANT_ID"        =
    "AZURE_APPID_URI"        =
    "AZURE_STORAGE_ACCOUNT_KEY" =
    "AZURE_STORAGE_ACCOUNT_NAME" =
    "AZURE_CREDENTIALS_CLIENT_ID" =
    "AZURE_CREDENTIALS_CLIENT_SECRET" =
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_ID" =
    "AZURE_CREDENTIALS_CUSTOMER_CLIENT_SECRET" =
    "ADX_BASE_URI"           =
    "ADX_INGEST_URI"         =
    "EVENTBUS_BASEURI"       =
    "HOST_POSTGRES"          =
    "HOST_REDIS"             =
    "HOST_REDIS_PASSWORD"    =
    "HOST_ARGO_WORKFLOWS_SERVER"  =
    "RDS_HUB_LISTENER"            =
    "RDS_HUB_SENDER"              =
    "RDS_STORAGE_ADMIN"           =
    "RDS_STORAGE_READER"          =
    "RDS_STORAGE_WRITER"          =
    "HOST_RDS"                    =
    "HOST_RDS_POSTGRES"           =
    "SPRING_APPLICATION_JSON"     =
  }
  platform_secrets_name = "${var.namespace}-platform-secrets"
}

resource "kubectl_manifest" "secret" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-secret.yaml", local.values_platform_config)
}