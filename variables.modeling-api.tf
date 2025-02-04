variable "deploy_modeling_api_deployment" {
  type = bool
}

variable "deployment_helm_chart" {
  type = string
}

variable "deployment_helm_repository" {
  type = string
}

variable "deployment_helm_release_name" {
  type = string
}

variable "deployment_chart_package_version" {
  type = string
}

variable "modeling_api_monitoring_enabled" {
  type = bool
}

variable "modeling_api_monitoring_namespace" {
  type = string
}

variable "event_listener_dns_name" {
  type = string
}


variable "modeling_api_persistence_storage_class" {
  type = string
}

variable "docker_secret" {
  type = string
}

variable "wehbook_secret" {
  type = string
}