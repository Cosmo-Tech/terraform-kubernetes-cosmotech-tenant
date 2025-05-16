variable "dashboard_redis_auth_user" {
  type = string
}

variable "dashboard_deploy" {
  type = bool
}

variable "grafana_auth" {
  description = "Authentication credentials for Grafana provider in the format 'username:password'"
  type        = string
}

variable "postgresql_auth_user" {
  type = string
}

variable "postgresql_auth_password" {
  type = string
}

variable "postgresql_db" {
  type = string
}