variable "namespace" {
  type = string
}

variable "redis_port" {
  type = number
}

variable "redis_auth_user" {
  type = string
}

variable "redis_auth_password" {
  type = string
}


variable "postgresql_port" {
  type = number
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