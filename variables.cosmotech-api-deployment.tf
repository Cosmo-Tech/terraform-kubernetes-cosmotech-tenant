variable "deploy_cosmotech_api_deployment" {
  type = bool
}

variable "api_deployment_helm_chart" {
  type = string
}

variable "api_deployment_helm_repository" {
  type = string
}

variable "api_deployment_helm_release_name" {
  type = string
}

variable "api_deployment_chart_package_version" {
  type = string
}

variable "api_docker_secret" {
  type = string
}

variable "api_wehbook_secret" {
  type = string
}

variable "api_ingress_type" {
  type = string
}

variable "api_ngrok_host" {
  type = string
}