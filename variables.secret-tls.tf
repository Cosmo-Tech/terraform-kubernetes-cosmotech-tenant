variable "certificate_cert_content" {
  type = string
  default = ""
}

variable "certificate_key_content" {
  type    = string
  default = ""
}

variable "secret_tls_secret_name" {
  type    = string
  default = "custom-tls-secret"
}
