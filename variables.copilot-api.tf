variable "create_copilot_api" {
  type = bool
}

variable "copilot_api_helm_chart" {
  type    = string
}

variable "copilot_api_helm_repository" {
  type    = string
}

variable "copilot_api_helm_release_name" {
  type    = string
}

variable "copilot_api_chart_package_version" {
  type = string
}

variable "copilot_api_mode" {
  type        = string
  description = "Application mode: either 'supply-chain' or 'assets'."
}

variable "copilot_api_port" {
  type        = number
  description = "Port on which the API will run."
}

variable "copilot_api_ai_provider" {
  type        = string
  description = "Cloud provider for the AI service."
}

variable "copilot_api_aad_tenant_id" {
  type        = string
  description = "Azure Active Directory tenant ID."
}

variable "copilot_api_kusto_cluster_url" {
  type        = string
  description = "URL of the Azure Data Explorer (Kusto) cluster."
}

variable "copilot_api_kusto_database" {
  type        = string
  description = "Name of the Azure Data Explorer database."
}

variable "copilot_api_adx_aad_app_id" {
  type        = string
  description = "Azure AD Application ID for ADX ingestion."
}

variable "copilot_api_adx_aad_secret" {
  type        = string
  description = "Azure AD Application secret for ADX ingestion."
}

variable "copilot_api_context_file_path" {
  type        = string
  description = "Path to the file for the local vector store if IS_VECTOR_STORE_LOCAL is true."
}

variable "copilot_api_is_vector_store_local" {
  type        = bool
  description = "Flag indicating whether to build a local vector store (using FAISS) instead of using Azure AI Search."
}

variable "copilot_api_search_endpoint_url" {
  type        = string
  description = "Endpoint URL for Azure AI Search."
}

variable "copilot_api_search_api_key" {
  type        = string
  description = "API key for Azure AI Search."
}

variable "copilot_api_index_name" {
  type        = string
  description = "Name of the Azure AI Search index (e.g., 'supply-chain' or 'assets')."
}

variable "copilot_api_retrieved_document_nb" {
  type        = number
  description = "Number of documents to retrieve from the search service."
}

variable "copilot_api_chunk_size" {
  type        = number
  description = "Size of each chunk (in tokens) when splitting documents."
}

variable "copilot_api_chunk_overlap" {
  type        = number
  description = "Number of overlapping tokens between chunks."
}

variable "copilot_api_azure_open_ai_endpoint" {
  type        = string
  description = "Endpoint URL for Azure Open AI."
}

variable "copilot_api_azure_open_ai_api_key" {
  type        = string
  description = "API key for Azure Open AI."
}

variable "copilot_api_azure_open_ai_api_type" {
  type        = string
  description = "Type of API used for Azure Open AI."
}

variable "copilot_api_azure_open_ai_api_version" {
  type        = string
  description = "API version for Azure Open AI."
}

variable "copilot_api_llm_deployment_name" {
  type        = string
  description = "Name of the LLM deployment for generating natural language responses."
}

variable "copilot_api_embeddings_deployment_name" {
  type        = string
  description = "Name of the deployment for the embeddings model."
}

variable "copilot_api_temperature" {
  type        = number
  description = "Temperature parameter for the LLM (between 0 and 1)."
}

variable "copilot_api_max_token" {
  type        = number
  description = "Maximum number of tokens for LLM responses."
}

variable "copilot_api_streaming" {
  type        = bool
  description = "Flag to enable streaming responses from the LLM."
}

variable "copilot_api_adx_retrieved_row_nb" {
  type        = number
  description = "Number of rows to retrieve from ADX."
}

variable "copilot_api_cosmotech_api_host" {
  type        = string
  description = "Host URL for the Cosmo Tech API."
}

variable "copilot_api_cosmotech_api_scope" {
  type        = string
  description = "Scope for the Cosmo Tech API."
}

variable "copilot_api_cosmotech_api_tenant_id" {
  type        = string
  description = "Tenant ID for the Cosmo Tech API."
}

variable "copilot_api_cosmotech_api_client_id" {
  type        = string
  description = "Client ID for the Cosmo Tech API."
}

variable "copilot_api_cosmotech_api_client_secret" {
  type        = string
  description = "Client secret for the Cosmo Tech API."
}

variable "copilot_api_organization" {
  type        = string
  description = "Organization ID for Cosmo Tech."
}

variable "copilot_api_workspace" {
  type        = string
  description = "Workspace ID for Cosmo Tech."
}

variable "copilot_api_azure_bot_app_id" {
  type        = string
  description = "Azure Bot Application ID."
}

variable "copilot_api_azure_bot_password" {
  type        = string
  description = "Password for the Azure Bot Application."
}

variable "copilot_api_azure_bot_directline_secret" {
  type        = string
  description = "DirectLine secret for the Azure Bot."
}

variable "app_path" {
  type = string
  description = "Copilot API app path"
}