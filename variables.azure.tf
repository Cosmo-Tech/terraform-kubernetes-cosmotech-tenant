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

variable "kubernetes_resource_group" {
  type = string
}

variable "tenant_id" {
  type = string
}