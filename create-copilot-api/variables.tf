variable "kubernetes_tenant_namespace" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "app_path" {
  type = string
}

variable "tls_secret_name" {
  type = string
}

variable "cosmotech_api_version" {
  type = string
}

variable "helm_chart" {
  type = string
}

variable "helm_repository" {
  type = string
}

variable "helm_release_name" {
  type = string
}

variable "chart_package_version" {
  type = string
}

variable "mode" {
  type = string
}

variable "port" {
  type = number
}

variable "ai_provider" {
  type = string
}

variable "aad_tenant_id" {
  type = string
}

variable "kusto_cluster_url" {
  type = string
}

variable "kusto_database" {
  type = string
}

variable "adx_aad_app_id" {
  type = string
}

variable "adx_aad_secret" {
  type = string
}

variable "context_file_path" {
  type = string
}

variable "is_vector_store_local" {
  type = bool
}

variable "search_endpoint_url" {
  type = string
}

variable "search_api_key" {
  type = string
}

variable "index_name" {
  type = string
}

variable "retrieved_document_nb" {
  type = number
}

variable "chunk_size" {
  type = number
}

variable "chunk_overlap" {
  type = number
}

variable "azure_open_ai_endpoint" {
  type = string
}

variable "azure_open_ai_api_key" {
  type = string
}

variable "azure_open_ai_api_type" {
  type = string
}

variable "azure_open_ai_api_version" {
  type = string
}

variable "llm_deployment_name" {
  type = string
}

variable "embeddings_deployment_name" {
  type = string
}

variable "temperature" {
  type = number
}

variable "max_token" {
  type = number
}

variable "streaming" {
  type = bool
}

variable "adx_retrieved_row_nb" {
  type = number
}

variable "cosmotech_api_host" {
  type = string
}

variable "cosmotech_api_scope" {
  type = string
}

variable "cosmotech_api_tenant_id" {
  type = string
}

variable "cosmotech_api_client_id" {
  type = string
}

variable "cosmotech_api_client_secret" {
  type = string
}

variable "organization" {
  type = string
}

variable "workspace" {
  type = string
}

variable "azure_bot_app_id" {
  type = string
}

variable "azure_bot_password" {
  type = string
}

variable "azure_bot_directline_secret" {
  type = string
}
