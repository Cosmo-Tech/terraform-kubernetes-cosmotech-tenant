variable "argo_helm_repo_url" {
  type    = string
  default = "https://argoproj.github.io/argo-helm"
}

variable "argo_helm_chart" {
  type    = string
  default = "argo-workflows"
}

variable "argo_version" {
  type    = string
  default = "0.41.2"
}

variable "argo_service_account" {
  type    = string
  default = ""
}

variable "argo_bucket_name" {
  type    = string
  default = "argo-workflows"
}

variable "argo_database" {
  type    = string
  default = "argo_workflows"
}

variable "argo_postgresql_secret_name" {
  type    = string
  default = "postgres-config"
}

variable "requeue_time" {
  type    = string
  default = "1s"
}

variable "archive_ttl" {
  type    = string
  default = "3d"
}

variable "argo_deploy" {
  type = bool
}