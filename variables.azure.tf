variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "network_sp_client_id" {
  type = string
}

variable "network_sp_client_secret" {
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

variable "eventbus_uri" {
  type = string
}

variable "kubernetes_resource_group" {
  type = string
}
