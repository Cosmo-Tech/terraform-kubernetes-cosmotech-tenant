variable "api_replicas" {
  type = number
}

variable "monitoring_enabled" {
  type = bool
}

variable "monitoring_namespace" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "tls_secret_name" {
  type = string
}

variable "redis_admin_password" {
  type = string
}

variable "acr_login_password" {
  type = string
}

variable "acr_login_server" {
  type = string
}

variable "acr_login_username" {
  type = string
}

variable "adx_uri" {
  type = string
}

variable "adx_ingestion_uri" {
  type = string
}

variable "eventbus_uri" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "network_sp_client_id" {
  type = string
}

variable "network_sp_client_secret" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type = bool
}

variable "redis_port" {
  type = number
}

variable "helm_chart" {
  type = string
}

variable "helm_repository" {
  type = string
}

variable "cosmotech_api_version_path" {
  type = string
}

variable "cosmotech_api_version" {
  type = string
}

variable "helm_release_name" {
  type = string
}

variable "chart_package_version" {
  type = string
}

variable "argo_service_account" {
  type = string
}

variable "argo_release_name" {
  type = string
}

variable "is_multitenant" {
  type = bool
}

variable "use_internal_result_services" {
  type = bool
}

variable "tenant_resource_group" {
  type = string
}

variable "postgresql_release_name" {
  type = string
}

variable "postgresql_reader_username" {
  type = string
}

variable "postgresql_reader_password" {
  type = string
}

variable "postgresql_writer_username" {
  type = string
}

variable "postgresql_writer_password" {
  type = string
}

variable "postgresql_admin_username" {
  type = string
}

variable "postgresql_admin_password" {
  type = string
}

variable "rabbitmq_release_name" {
  type = string
}

variable "rabbitmq_listener_username" {
  type = string
}

variable "rabbitmq_listener_password" {
  type = string
}

variable "rabbitmq_sender_username" {
  type = string
}

variable "rabbitmq_sender_password" {
  type = string
}

variable "list_apikey_allowed" {
  type = list(object({
    name           = string
    apiKey         = string
    associatedRole = string
    securedUris    = list(string)
  }))
}

variable "identifier_uri" {
  type = string
}

variable "persistence_size" {
  type = string
}

variable "persistence_storage_class" {
  type = string
}

variable "keycloak_client_id" {
  type = string
}

variable "keycloak_client_secret" {
  type = string
}

variable "tenant_sp_client_secret" {
  type = string
}

variable "tenant_sp_client_id" {
  type = string
}

variable "max_file_size" {
  type = string
}

variable "max_request_size" {
  type = string
}

variable "list_authorized_mime_types" {
  type = list(string)
}

variable "api_graph_enabled" {
  type = bool
}
