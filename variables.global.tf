variable "monitoring_namespace" {
  type = string
}

variable "api_dns_name" {
  type = string
}

variable "monitoring_enabled" {
  type = bool
}

variable "tls_certificate_type" {
  type = string
}

variable "kubernetes_tenant_namespace" {
  description = "The namespace of the tenant"
  type        = string
}