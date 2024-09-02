variable "tls_certificate_custom_certificate" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_key" {
  type    = string
  default = ""
}

variable "secret_tls_secret_name" {
  type    = string
  default = "custom-tls-secret"
}

variable "tls_deploy" {
  type = bool
}