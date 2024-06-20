variable "redis_admin_password" {
  type = string
}

variable "namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_release_name" {
  type    = string
  default = "cosmotechredis"
}

variable "helm_chart_name" {
  type    = string
  default = "redis"
}

variable "chart_redis_version" {
  type    = string
}

variable "redis_pv_capacity" {
  type = string
}

variable "version_redis_cosmotech" {
  type    = string
  default = "1.0.8"
}
