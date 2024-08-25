variable "vault_namespace" {
  type = string
}

variable "enable_vault" {
  type = bool
}

variable "allowed_namespace" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vault_address" {
  type = string
}

variable "vault_sops_namespace" {
  type = string
}

variable "vault_engine_secret" {
  type = string
}

variable "vault_organization" {
  type = string
}
