variable "redis_host_namespace" {
  type = string
}

variable "redis_port" {
  type = number
  default = 6379
}

variable "redis_auth_user" {
  type = string
}

variable "redis_auth_password" {
  type = string
}
