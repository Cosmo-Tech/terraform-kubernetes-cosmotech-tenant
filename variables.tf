variable "api_dns_name" {
  type = string
}

variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "tenant_id" {
  description = "The tenant id"
  type        = string
}

variable "client_id" {
  description = "The client id of the app registration used to build this"
  type        = string
}

variable "client_secret" {
  description = "The client secret of the app registration used to build this"
  type        = string
}

variable "location" {
  type = string
}

variable "tls_secret_name" {
  type = string
}

variable "tls_certificate_type" {
}

variable "kubernetes_tenant_namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "chart_package_version" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "redis_disk_name" {
  type = string
}
variable "redis_disk_sku" {
  type = string
}

variable "argo_minio_persistence_size" {
  type = string
}

variable "argo_minio_requests_memory" {
  type = string
}

variable "network_client_id" {
  type = string
}

variable "network_client_secret" {
  type = string
}

variable "tenant_client_id" {
  type        = string
  description = "The client_id of the platform's service principal"
}

variable "tenant_client_secret" {
  type        = string
  description = "The client_secret of the platform's service principal"
}

variable "managed_disk_id" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "storage_account_name" {
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

variable "adx_ingestion_uri" {
  type = string
}

variable "adx_uri" {
  type = string
}

variable "cosmos_uri" {
  type    = string
  default = ""
}

variable "cosmos_key" {
  type    = string
  default = ""
}

variable "eventbus_uri" {
  type = string
}

variable "create_rabbitmq" {
  description = "Whether to create RabbitMQ resources"
  type        = bool
}

variable "kube_config" {
}

variable "archive_ttl" {
  type = string
}

variable "cluster_issuer_name" {
  type = string
}

variable "cosmotech_api_version_path" {
  type = string
}

variable "cosmotech_api_version" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type = bool
}

variable "redis_port" {
  type = number
}

variable "monitoring_enabled" {
  type = bool
}

variable "api_replicas" {
  type = number
}

variable "tls_certificate_custom_certificate" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_key" {
  type    = string
  default = ""
}

variable "list_apikey_allowed" {
  type = list(object({
    name           = string
    apiKey         = string
    associatedRole = string
    securedUris    = list(string)
  }))
  default = [{
    name           = ""
    apiKey         = ""
    associatedRole = ""
    securedUris    = []
  }]
}

variable "identifier_uri" {
  type = string
}