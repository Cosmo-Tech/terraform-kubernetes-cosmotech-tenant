variable "cert_cluster_issuer_name" {
  type = string
}

variable "cert_tls_namespace" {
  type = string
}

variable "cert_tls_secret_name" {
  type = string
  default = "let_s_encrypt"
}
