

variable "monitoring_enabled" {
  type = bool
}

variable "monitoring_namespace" {
  type = string
}

variable "api_dns_name" {
  type = string
}


variable "helm_chart" {
  type    = string
}

variable "helm_repository" {
  type    = string
}


variable "helm_release_name" {
  type    = string
}

variable "chart_package_version" {
  type = string
}


variable "persistence_storage_class" {
  type = string
}

variable "kubernetes_tenant_namespace" {
  type = string
}

variable "wehbook_secret" {
  type = string
}

variable "docker_secret" {
  type = string
}

variable "argo_service_account" {
  type    = string
}

variable "argo_release_name" {
  type = string
}

variable "ingress_type" {
  type = string
}

variable "ngrok_host" {
  type = string
}

variable "use_oci_registry" {
  type = string
}