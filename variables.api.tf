variable "api_deploy" {
  type = bool
}
variable "api_helm_chart" {
  type = string
}
variable "api_helm_repository" {
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
variable "api_identifier_uri" {
  type = string
}
variable "api_replicas" {
  type = number
}
variable "api_version_path" {
  type = string
}
variable "api_version" {
  type = string
}
variable "api_ingress_enabled" {
  type = bool
}
variable "api_list_apikey_allowed" {
  type = list(object({
    name           = string
    apiKey         = string
    associatedRole = string
    securedUris    = list(string)
  }))
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
  type = bool
}
variable "api_acr_login_password" {
  type = string
}
variable "api_acr_login_server" {
  type = string
}
variable "api_acr_login_server_url" {
  type = string
}
variable "api_acr_login_username" {
  type = string
}
variable "api_adx_uri" {
  type = string
}
variable "api_adx_ingestion_uri" {
  type = string
}
variable "api_eventbus_uri" {
  type = string
}
variable "api_storage_account_key" {
  type = string
}
variable "api_storage_account_name" {
  type = string
}
variable "api_identity_provider" {}
variable "api_auth_provider" {
  type = string
}
