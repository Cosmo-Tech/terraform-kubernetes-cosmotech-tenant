variable "postgresql_cosmotech_api_reader_username" {
  type = string
}

variable "postgresql_cosmotech_api_writer_username" {
  type = string
}

variable "postgresql_cosmotech_api_admin_username" {
  type = string
}

variable "postgresql_initdb_secret_name" {
  type = string
}

variable "postgresql_argo_user" {
  type = string
}

variable "postgresql_secret_name" {
  type = string
}

variable "postgresql_argo_database" {
  type = string
}

variable "postgresql_helm_repo_url" {
  type = string
}

variable "postgresql_helm_chart" {
  type = string
}

variable "postgresql_version" {
  type = string
}

variable "postgresql_persistence_size" {
  type = string
}
variable "postgresql_deploy" {
  type = bool
}