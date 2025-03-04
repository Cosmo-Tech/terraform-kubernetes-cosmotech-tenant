variable "kubernetes_tenant_namespace" {
  description = "The namespace of the tenant"
  type        = string
}

variable "api_dns_name" {
  description = "The DNS name of the API"
  type        = string
}
variable "keycloak_realm_jwt_claim_api_client" {
  type = string
}
variable "keycloak_realm_jwt_claim_web_client" {
  type = string
}

variable "keycloak_add_identity_provider_azure" {
  type = bool
}

variable "keycloak_user_app_role" {
  type = list(string)
}

variable "tenant_id" {
  type = string
}

variable "api_version_path" {
  type = string
}