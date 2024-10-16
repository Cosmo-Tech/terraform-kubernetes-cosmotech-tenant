variable "deploy_api" {
  type = bool
}

variable "cosmotech_api_helm_chart" {
  type    = string
}

variable "cosmotech_api_helm_repository" {
  type    = string
}

variable "cosmotech_api_helm_release_name" {
  type    = string
}

variable "cosmotech_api_chart_package_version" {
  type = string
}

variable "is_multitenant" {
  type    = bool
}

variable "monitoring_enabled" {
  type    = bool
}

variable "monitoring_namespace" {
  type    = string
}

variable "identifier_uri" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "api_replicas" {
  type    = number
}

variable "cosmotech_api_version_path" {
  type = string
}

variable "cosmotech_api_version" {
  type = string
}

variable "cosmotech_api_ingress_enabled" {
  type    = bool
}

variable "cosmotech_api_persistence_size" {
  type    = string
}

variable "cosmotech_api_persistence_storage_class" {
  type    = string
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
