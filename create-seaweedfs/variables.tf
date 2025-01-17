variable "namespace" {
  type = string
}

variable "chart_version" {
  type = string
}

variable "postgresql_host" {
  type = string
}

variable "postgresql_port" {
  type = number
}

variable "postgresql_database" {
  type = string
}

variable "postgresql_username" {
  type = string
}

variable "postgresql_password_secret" {
  type = string
}
