locals {
  values_cosmotech_api = {
    "API_REPLICAS"                  = var.api_replicas
    "MONITORING_ENABLED"            = var.monitoring_enabled
    "MONITORING_NAMESPACE"          = var.monitoring_namespace
    "TLS_SECRET_NAME"               = local.local_tls_secret_name
    "NAMESPACE"                     = var.kubernetes_tenant_namespace
    "REDIS_PORT"                    = var.redis_port
    "REDIS_PASSWORD"                = var.redis_admin_password
    "APP_ID_URI"                    = local.local_identifier_uri
    "ARGO_SERVICE_ACCOUNT"          = var.argo_service_account
    "ARGO_RELEASE_NAME"             = var.argo_release_name
    "COSMOTECH_API_INGRESS_ENABLED" = var.cosmotech_api_ingress_enabled
    "COSMOTECH_API_DNS_NAME"        = var.api_dns_name
    "API_VERSION"                   = var.cosmotech_api_version
    "API_VERSION_PATH"              = var.cosmotech_api_version_path
    "ACR_LOGIN_PASSWORD"            = local.local_acr_login_password
    "ACR_LOGIN_SERVER"              = var.acr_login_server
    "ACR_LOGIN_USERNAME"            = var.acr_login_username
    "COSMOS_KEY"                    = var.cosmos_key
    "COSMOS_URI"                    = var.cosmos_uri
    "CLIENT_ID"                     = var.client_id
    "CLIENT_SECRET"                 = var.client_secret
    "TENANT_ID"                     = var.tenant_id
    "ADX_URI"                       = var.adx_uri
    "ADX_INGESTION_URI"             = var.adx_ingestion_uri
    "EVENTBUS_URI"                  = var.eventbus_uri
    "STORAGE_ACCOUNT_KEY"           = local.local_storage_account_name
    "STORAGE_ACCOUNT_NAME"          = var.storage_account_name
    "NETWORK_ADT_PASSWORD"          = var.network_sp_client_secret
    "NETWORK_ADT_CLIENTID"          = var.network_sp_client_id
    "MULTI_TENANT"                  = var.is_multitenant
    "USE_INTERNAL_RESULT_SERVICES"  = var.use_internal_result_services
    "TENANT_RESOURCE_GROUP"         = var.tenant_resource_group
    "POSTGRESQL_RELEASE_NAME"       = var.postgresql_release_name
    "POSTGRESQL_READER_USERNAME"    = var.postgresql_reader_username
    "POSTGRESQL_READER_PASSWORD"    = var.postgresql_reader_password
    "POSTGRESQL_WRITER_USERNAME"    = var.postgresql_writer_username
    "POSTGRESQL_WRITER_PASSWORD"    = var.postgresql_writer_password
    "POSTGRESQL_ADMIN_USERNAME"     = var.postgresql_admin_username
    "POSTGRESQL_ADMIN_PASSWORD"     = var.postgresql_admin_password
    "RABBITMQ_RELEASE_NAME"         = var.rabbitmq_release_name
    "RABBITMQ_LISTENER_USERNAME"    = var.rabbitmq_listener_username
    "RABBITMQ_LISTENER_PASSWORD"    = var.rabbitmq_listener_password
    "RABBITMQ_SENDER_USERNAME"      = var.rabbitmq_sender_username
    "RABBITMQ_SENDER_PASSWORD"      = var.rabbitmq_sender_password
    "ALLOWED_API_KEY_CONSUMERS"     = jsonencode(var.list_apikey_allowed)
    "PERSISTENCE_SIZE"              = var.persistence_size
    "PERSISTENCE_STORAGE_CLASS"     = var.persistence_storage_class
  }
  local_acr_login_password   = var.acr_login_password == "" ? data.kubernetes_secret.acr_login_password : var.acr_login_password
  local_storage_account_name = var.storage_account_key == "" ? data.kubernetes_secret.storage_account_password : var.storage_account_key
  local_instance_name        = "${var.helm_release_name}-${var.kubernetes_tenant_namespace}"
  local_tls_secret_name      = "${var.tls_secret_name}-${var.kubernetes_tenant_namespace}"
  local_identifier_uri       = var.identifier_uri != "" ? var.identifier_uri : "https://${var.api_dns_name}"
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

resource "helm_release" "cosmotech-api" {
  name       = local.local_instance_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.chart_package_version
  namespace  = var.kubernetes_tenant_namespace

  reset_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_cosmotech_api)
  ]
}
