variable "namespace" {
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

variable "postgresql_port" {
  type = number
  default = 5432
}

variable "postgresql_auth_user" {
  type = string
}

variable "postgresql_auth_password" {
  type = string
}

variable "postgresql_db" {
  type = string
  default = "argo_workflows"
}
