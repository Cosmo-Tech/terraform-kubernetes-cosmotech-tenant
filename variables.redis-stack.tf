
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

variable "version_redis_cosmotech" {
  type        = string
  description = "Redis version"

  validation {
    condition = (
      (
        (tonumber(split(".", var.cosmotech_api_version)[0]) == 3 &&
        tonumber(split(".", var.cosmotech_api_version)[1]) >= 2) ||
        (tonumber(split(".", var.cosmotech_api_version)[0]) > 3)
      ) ?
      var.version_redis_cosmotech == "1.0.12" :
      var.version_redis_cosmotech == "1.0.8"
    )
    error_message = "Redis version must be 1.0.12 for API >= 3.2.0, or 1.0.8 for previous versions"
  }
}