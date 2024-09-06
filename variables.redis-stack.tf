
variable "redis_helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "redis_helm_release_name" {
  type    = string
  default = "cosmotechredis"
}

variable "redis_helm_chart_name" {
  type    = string
  default = "redis"
}

variable "redis_chart_version" {
  type    = string
  default = "17.8.0"
}

variable "redis_persistence_size" {
  type    = string
  default = "64Gi"
}

variable "redis_port" {
  type    = number
  default = 6379
}

variable "redis_deploy" {
  type = bool
}

variable "redis_admin_password" {
  type    = string
  default = ""
}