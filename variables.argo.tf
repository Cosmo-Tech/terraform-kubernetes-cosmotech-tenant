variable "argo_helm_repo_url" {
  type = string
}

variable "argo_helm_chart" {
  type = string
}

variable "argo_version" {
  type = string
}

variable "argo_service_account" {
  type = string
}

variable "argo_bucket_name" {
  type = string
}

variable "argo_database" {
  type = string
}

variable "argo_postgresql_secret_name" {
  type = string
}

variable "requeue_time" {
  type = string
}

variable "archive_ttl" {
  type = string
}

variable "argo_deploy" {
  type = bool
}
