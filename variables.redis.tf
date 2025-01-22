variable "redis_admin_password" {
  type = string
}

variable "redis_helm_repo_url" {
  type = string
}

variable "redis_helm_release_name" {
  type = string
}

variable "redis_helm_chart_name" {
  type = string
}

variable "redis_chart_version" {
  type = string
}

variable "redis_pv_capacity" {
  type = string
}

variable "redis_cosmotech_version" {
  type = string
}

variable "redis_persistence_size" {
  type = string
}
variable "redis_deploy" {
  type = bool
}