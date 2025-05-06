variable "dashboard_redis_auth_user" {
  type    = string
  default = "default"
}

variable "dashboard_deploy" {
  type = bool
}

variable "grafana_auth" {
  description = "Authentication credentials for Grafana provider in the format 'username:password'"
  type        = string
}