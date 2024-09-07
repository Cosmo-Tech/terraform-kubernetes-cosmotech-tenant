variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "cosmotech_api_reader_username" {
  type    = string
}

variable "cosmotech_api_writer_username" {
  type    = string
}

variable "cosmotech_api_admin_username" {
  type    = string
}

variable "postgresql_initdb_secret_name" {
  type    = string
}

variable "argo_postgresql_user" {
  type    = string
}

variable "postgresql_secret_name" {
  type    = string
}

variable "argo_database" {
  type    = string
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "postgresql_version" {
  type    = string
}

variable "persistence_size" {
  type = string
}

variable "postgresql_secrets_config_create" {
  type = bool
}