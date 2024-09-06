
variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "tls_certificate_type" {
  type    = string
  default = "let_s_encrypt"
}

variable "cert_deploy" {
  type = bool
}
