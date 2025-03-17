variable "api_replicas" {
  type = number
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

variable "network_client_id" {
  type = string
}

variable "network_client_secret" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type = bool
}

variable "redis_port" {
  type = number
}

variable "api_helm_chart" {
  type = string
}

variable "api_helm_repository" {
  type = string
}

variable "api_version_path" {
  type = string
}

variable "api_version" {
  type = string
}

variable "api_helm_release_name" {
  type = string
}

variable "api_chart_package_version" {
  type = string
}

variable "api_is_multitenant" {
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

variable "rabbitmq_listener_password" {
  type = string
}

variable "rabbitmq_sender_password" {
  type = string
}

variable "api_list_apikey_allowed" {
  type = list(object({
    name           = string
    apiKey         = string
    associatedRole = string
    securedUris    = list(string)
  }))
}

variable "api_identifier_uri" {
  type = string
}

variable "api_persistence_size" {
  type = string
}

variable "api_persistence_storage_class" {
  type = string
}
variable "api_deploy" {
  type = bool
}

variable "api_list_authorized_mime_types" {
  type = list(string)
}

variable "api_max_file_size" {
  type = string
}

variable "api_max_request_size" {
  type = string
}

variable "api_graph_enabled" {
  type = string
}