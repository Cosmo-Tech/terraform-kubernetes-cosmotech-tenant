variable "namespace" {
  type = string
}

variable "helm_repo_url" {
  type = string
}

variable "helm_chart" {
  type = string
}

variable "helm_chart_version" {
  type = string
}

variable "s3_endpoint" {
  type = string
}

variable "s3_bucket_name" {
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

variable "postgres_argo_user" {
  type = string
}

variable "argo_database" {
  type = string
}

variable "argo_postgresql_secret_name" {
  type = string
}
