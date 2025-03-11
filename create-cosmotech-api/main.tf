locals {
  local_acr_login_password       = var.acr_login_password == "" ? data.kubernetes_secret.acr_login_password.data.password : var.acr_login_password
  local_acr_login_registry       = var.acr_login_server == "" ? data.kubernetes_secret.acr_login_password.data.registry : var.acr_login_server
  local_acr_login_username       = var.acr_login_username == "" ? data.kubernetes_secret.acr_login_password.data.username : var.acr_login_username
  local_storage_account_key      = var.storage_account_key == "" ? data.kubernetes_secret.storage_account_password.data.password : var.storage_account_key
  local_storage_account_name     = var.storage_account_name == "" ? data.kubernetes_secret.storage_account_password.data.name : var.storage_account_name
  local_instance_name            = "${var.helm_release_name}-${var.kubernetes_tenant_namespace}"
  local_tls_secret_name          = "${var.tls_secret_name}-${var.kubernetes_tenant_namespace}"
  local_identifier_uri           = var.identifier_uri != "" ? var.identifier_uri : "https://${var.api_dns_name}"
  local_network_sp_client_secret = var.network_sp_client_secret == "" ? data.kubernetes_secret.network_client_password.data.password : var.network_sp_client_secret
  local_tenant_sp_client_secret  = var.tenant_sp_client_secret == "" ? data.kubernetes_secret.platform_client_password.data.password : var.tenant_sp_client_secret
  local_adx_ingestion_uri        = var.adx_ingestion_uri == "" ? data.kubernetes_secret.adx_ingestion_uri_secret.data.uri : var.adx_ingestion_uri
  local_tenant_id                = var.api_auth_provider == "azure" ? var.tenant_id : var.kubernetes_tenant_namespace

  values_cosmotech_api = {
    "API_REPLICAS"                  = var.api_replicas
    "MONITORING_ENABLED"            = var.monitoring_enabled
    "GRAPH_ENABLED"                 = var.api_graph_enabled
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
    "ACR_LOGIN_SERVER"              = local.local_acr_login_registry
    "ACR_LOGIN_USERNAME"            = local.local_acr_login_username
    "CLIENT_ID"                     = var.tenant_sp_client_id
    "CLIENT_SECRET"                 = local.local_tenant_sp_client_secret
    "TENANT_ID"                     = local.local_tenant_id
    "ADX_URI"                       = var.adx_uri
    "ADX_INGESTION_URI"             = local.local_adx_ingestion_uri
    "EVENTBUS_URI"                  = var.eventbus_uri
    "STORAGE_ACCOUNT_KEY"           = local.local_storage_account_key
    "STORAGE_ACCOUNT_NAME"          = local.local_storage_account_name
    "NETWORK_ADT_PASSWORD"          = local.local_network_sp_client_secret
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
    "AUTHORIZED_MIME_TYPES"         = jsonencode(var.list_authorized_mime_types)
    "PERSISTENCE_SIZE"              = var.persistence_size
    "PERSISTENCE_STORAGE_CLASS"     = var.persistence_storage_class
    "KEYCLOAK_CLIENT_ID"            = var.keycloak_client_id
    "KEYCLOAK_CLIENT_SECRET"        = var.keycloak_client_secret
    "MAX_FILE_SIZE"                 = var.max_file_size
    "MAX_REQUEST_SIZE"              = var.max_request_size
    "IDENTITY_PROVIDER"             = jsonencode(local.api_identity_provider)
  }
  api_identity_provider = merge(var.api_identity_provider, local.api_keycloak_identity)
  api_keycloak_identity = {
    identity = {
      clientId     = var.keycloak_client_id
      clientSecret = var.keycloak_client_secret
      tenantId     = var.kubernetes_tenant_namespace
    }
  }
}

data "kubernetes_secret" "network_client_password" {
  metadata {
    name      = "network-client-secret"
    namespace = "default"
  }
}

data "kubernetes_secret" "platform_client_password" {
  metadata {
    name      = "platform-client-secret"
    namespace = var.kubernetes_tenant_namespace
  }
}


data "kubernetes_secret" "adx_ingestion_uri_secret" {
  metadata {
    name      = "adx-admin-secret"
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

resource "helm_release" "cosmotech-api" {
  name       = local.local_instance_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.chart_package_version
  namespace  = var.kubernetes_tenant_namespace

  reset_values = true
  timeout      = 300

  values = [
    templatefile("${path.module}/values.yaml", local.values_cosmotech_api)
  ]
}
