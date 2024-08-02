variable "redis_admin_password" {
  type = string
}

variable "namespace" {
  type = string
}

variable "helm_repo_url" {
  type = string
}

variable "helm_release_name" {
  type = string
}

variable "helm_chart_name" {
  type = string
}

variable "chart_redis_version" {
  type = string
}

variable "redis_pv_capacity" {
  type = string
}

variable "version_redis_cosmotech" {
  type = string
}
