locals {
  local_instance_name            = "${var.helm_release_name}-${var.kubernetes_tenant_namespace}"

  values_cosmotech_copilot_api = {
    "COSMOTECH_API_DNS_NAME"     = var.api_dns_name
    "TLS_SECRET_NAME"            = var.tls_secret_name
    "COSMOTECH_API_VERSION"      = var.cosmotech_api_version
    "COSMOTECH_API_MULTI_TENANT" = var.cosmotech_api_multi_tenant
    "MODE"                       = var.mode
    "PORT"                       = var.port
    "AI_PROVIDER"                = var.ai_provider
    "AAD_TENANT_ID"              = var.aad_tenant_id
    "KUSTO_CLUSTER_URL"          = var.kusto_cluster_url
    "KUSTO_DATABASE"             = var.kusto_database
    "ADX_AAD_APP_ID"             = var.adx_aad_app_id
    "ADX_AAD_SECRET"             = var.adx_aad_secret
    "CONTEXT_FILE_PATH"          = var.context_file_path
    "IS_VECTOR_STORE_LOCAL"      = var.is_vector_store_local
    "SEARCH_ENDPOINT_URL"        = var.search_endpoint_url
    "SEARCH_API_KEY"             = var.search_api_key
    "INDEX_NAME"                 = var.index_name
    "RETRIEVED_DOCUMENT_NB"      = var.retrieved_document_nb
    "CHUNK_SIZE"                 = var.chunk_size
    "CHUNK_OVERLAP"              = var.chunk_overlap
    "AZURE_OPEN_AI_ENDPOINT"     = var.azure_open_ai_endpoint
    "AZURE_OPEN_AI_API_KEY"      = var.azure_open_ai_api_key
    "AZURE_OPEN_AI_API_TYPE"     = var.azure_open_ai_api_type
    "AZURE_OPEN_AI_API_VERSION"  = var.azure_open_ai_api_version
    "LLM_DEPLOYMENT_NAME"        = var.llm_deployment_name
    "EMBEDDINGS_DEPLOYEMENT_NAME"= var.embeddings_deployment_name
    "TEMPERATURE"                = var.temperature
    "MAX_TOKEN"                  = var.max_token
    "STREAMING"                  = var.streaming
    "ADX_RETRIEVED_ROW_NB"       = var.adx_retrieved_row_nb
    "COMOSTECH_API_HOST"         = var.cosmotech_api_host
    "COSMOTECH_API_SCOPE"        = var.cosmotech_api_scope
    "COMOSTECH_API_TENANT_ID"    = var.cosmotech_api_tenant_id
    "COSMOTECH_API_CLIENT_ID"    = var.cosmotech_api_client_id
    "COSMOTECH_API_CLIENT_SECRET"= var.cosmotech_api_client_secret
    "ORGANIZATION"               = var.organization
    "WORKSPACE"                  = var.workspace
    "AZURE_BOT_APP_ID"           = var.azure_bot_app_id
    "AZURE_BOT_PASSWORD"         = var.azure_bot_password
    "AZURE_BOT_DIRECTLINE_SECRET"= var.azure_bot_directline_secret
  }
}

resource "helm_release" "cosmotech-copilot-api" {
  name       = local.local_instance_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.chart_package_version
  namespace  = var.kubernetes_tenant_namespace

  reset_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_cosmotech_copilot_api)
  ]
}
