variable "namespace" {
  type = string
}

variable "tls_secret_name" {
  type    = string
  default = "custom-tls-secret"
}

variable "tls_certificate_custom_certificate" {
  type    = string
  default = ""
}

variable "tls_certificate_custom_key" {
  type    = string
  default = ""
}