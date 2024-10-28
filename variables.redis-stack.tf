
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

variable "redis_persistence_size" {
  type = string
}

variable "redis_port" {
  type = number
}

variable "redis_deploy" {
  type = bool
}

variable "redis_admin_password" {
  type = string
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
