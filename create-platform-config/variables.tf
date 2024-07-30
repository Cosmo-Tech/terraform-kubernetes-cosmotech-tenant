variable "namespace" {
  type = string
}

variable "api_version" {
  type = string
}

variable "acr_server" {
  type = string
}

variable "acr_username" {
  type = string
}

variable "acr_password" {
  type = string
}

variable "host_cosmotech_api" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "argo_service_account_name" {
  type = string
}

variable "azure_tenant_id" {
  type = string
}

variable "azure_appid_uri" {
  type = string
}

variable "azure_storage_account_key" {
  type = string
}

variable "azure_storage_account_name" {
  type = string
}

variable "azure_platform_credentials_client_id" {
  type = string
}

variable "azure_platform_credentials_client_secret" {
  type = string
}

variable "azure_credentials_network_client_id" {
  type = string
}

variable "azure_credentials_network_client_secret" {
  type = string
}


variable "adx_base_uri" {
  type = string
}

variable "adx_ingest_uri" {
  type = string
}

variable "eventbus_base_uri" {
  type = string
}

variable "host_redis_password" {
  type = string
}

variable "rds_hub_listener" {
  type = string
}

variable "rds_hub_sender" {
  type = string
}

variable "rds_storage_admin" {
  type = string
}

variable "rds_storage_reader" {
  type = string
}

variable "rds_storage_writer" {
  type = string
}

variable "host_rds" {
  type = string
}

variable "host_rds_postgres" {
  type = string
}

variable "postgres_release_name" {
  type = string
}

variable "argo_release_name" {
  type = string
}
