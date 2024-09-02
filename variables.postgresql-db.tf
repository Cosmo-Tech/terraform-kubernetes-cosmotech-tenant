variable "postgresql_deploy" {
  type    = bool
  default = true
}

variable "postgresql_persistence_size" {
  type    = string
  default = "8Gi"
}

variable "postgresql_version" {
  type    = string
  default = "11.6.12"
}

variable "postgresql_helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "postgresql_helm_chart" {
  type    = string
  default = "postgresql"
}

variable "cosmotech_api_reader_username" {
  type    = string
  default = "cosmotech_api_reader"
}

variable "cosmotech_api_writer_username" {
  type    = string
  default = "cosmotech_api_writer"
}

variable "cosmotech_api_admin_username" {
  type    = string
  default = "cosmotech_api_admin"
}

variable "postgresql_initdb_secret_name" {
  type    = string
  default = "postgres-initdb"
}

variable "argo_postgresql_user" {
  type    = string
  default = "argo"
}

variable "postgresql_secret_name" {
  type    = string
  default = "postgres-config"
}
