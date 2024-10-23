variable "vault_namespace" {
  type    = string
  default = "vault"
}

variable "allowed_namespace" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vault_address" {
  type    = string
  default = "http://vault.vault.svc.cluster.local"
}

variable "vault_sops_namespace" {
  type    = string
  default = "vault-secrets-operator"
}

variable "vault_engine_secret" {
  type = string
}
