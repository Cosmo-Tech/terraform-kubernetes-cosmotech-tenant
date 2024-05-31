variable "cluster_issuer_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "namespace" {
  type = string
}

variable "tls_secret_name" {
  type    = string
  default = "letsencrypt-prod"
}

variable "api_dns_name" {
  type = string
}