variable "deploy_cosmotech_api_tekton_pipline" {
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

variable "api_webhook_secret" {
  type = string
}

variable "api_ingress_type" {
  type = string
}

variable "api_ngrok_host" {
  type = string
}

variable "api_use_oci_registry" {
  type = string
}

variable "api_run_cypress_tests" {
  type = string
}

variable "tekton_node_selector" {
  description = "This variable is used to select the appropriate node for deploying Tekton pipline, either in KOB or in Azure. In KOB, the node is named 'service', while in Azure, it is named 'tekton'"
  type        = string
}