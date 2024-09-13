variable "tenant_id" {
  description = "The tenant id"
  type        = string
}

variable "kubernetes_tenant_namespace" {
  type = string
}

variable "tenant_resource_group" {
  type = string
}

variable "tenant_sp_client_id" {
  type        = string
  description = "The client_id of the platform's service principal"
}

variable "tenant_sp_client_secret" {
  type        = string
  description = "The client_secret of the platform's service principal"
}