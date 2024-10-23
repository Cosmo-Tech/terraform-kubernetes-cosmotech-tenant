variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_chart" {
  type    = string
  default = "argo-workflows"
}

variable "argo_version" {
  type    = string
  default = "9.1.6"
}

variable "argo_service_account" {
  type    = string
  default = ""
}

variable "s3_endpoint" {
  type = string
}

variable "s3_bucket_name" {
  type    = string
  default = "argo-workflows"
}

variable "s3_credentials_secret" {
  type = string
}

variable "s3_username_key" {
  type = string
}

variable "s3_password_key" {
  type = string
}

variable "postgres_release_name" {
  type = string
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
