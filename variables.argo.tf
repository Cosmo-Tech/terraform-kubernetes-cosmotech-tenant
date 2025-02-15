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

variable "s3_endpoint" {
  type = string
}

variable "argo_s3_bucket_name" {
  type = string
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
  type = string
}

variable "argo_postgresql_secret_name" {
  type = string
}

variable "argo_requeue_time" {
  type = string
}

variable "argo_archive_ttl" {
  type = string
}

variable "argo_deploy" {
  type = bool
}
