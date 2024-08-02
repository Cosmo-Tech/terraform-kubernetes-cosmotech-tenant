variable "deploy_api" {
  type = bool
}

variable "cosmotech_api_helm_chart" {
  type    = string
  default = "cosmotech-api-chart"
}

variable "cosmotech_api_helm_repository" {
  type    = string
  default = "oci://ghcr.io/cosmo-tech"
}

variable "cosmotech_api_helm_release_name" {
  type    = string
  default = "cosmotech-api"
}

variable "cosmotech_api_chart_package_version" {
  type = string
}

variable "is_multitenant" {
  type    = bool
  default = true
}

variable "monitoring_enabled" {
  type    = bool
  default = true
}

variable "monitoring_namespace" {
  type    = string
  default = "cosmotech-monitoring"
}

variable "identifier_uri" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "api_replicas" {
  type    = number
  default = 1
}

variable "cosmotech_api_version_path" {
  type = string
}

variable "cosmotech_api_version" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type    = bool
  default = true
}

variable "cosmotech_api_persistence_size" {
  type    = string
  default = "8Gi"
}

variable "cosmotech_api_persistence_storage_class" {
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