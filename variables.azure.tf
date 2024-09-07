variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "network_sp_client_id" {
  type = string
}

variable "network_sp_client_secret" {
  type    = string
  default = ""
}

variable "storage_account_key" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "acr_login_password" {
  type = string
  default = ""
}

variable "acr_login_server" {
  type = string
  default = ""
}

variable "acr_login_username" {
  type = string
  default = ""
}

variable "adx_ingestion_uri" {
  type = string
  default = ""
}

variable "adx_uri" {
  type = string
  default = ""
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
  default = ""
}

variable "kubernetes_resource_group" {
  type = string
}