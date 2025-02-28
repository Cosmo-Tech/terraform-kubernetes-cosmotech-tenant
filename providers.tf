terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.3"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = ">= 1.3.9"
}

provider "keycloak" {
  client_id                = var.keycloak_client_id
  username                 = var.keycloak_username
  password                 = var.keycloak_password
  url                      = var.keycloak_url
  tls_insecure_skip_verify = true
}

provider "kubernetes" {
  host                   = module.aks_kube_config.0.kubernetes_config_admin.0.host
  client_certificate     = module.aks_kube_config.0.kubernetes_config_client_certificate
  client_key             = module.aks_kube_config.0.kubernetes_config_client_key
  cluster_ca_certificate = module.aks_kube_config.0.kubernetes_config_cluster_ca_certificate
}


provider "kubectl" {
  host                   = module.aks_kube_config.0.kubernetes_config_admin.0.host
  client_certificate     = module.aks_kube_config.0.kubernetes_config_client_certificate
  client_key             = module.aks_kube_config.0.kubernetes_config_client_key
  cluster_ca_certificate = module.aks_kube_config.0.kubernetes_config_cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = module.aks_kube_config.0.kubernetes_config_admin.0.host
    client_certificate     = module.aks_kube_config.0.kubernetes_config_client_certificate
    client_key             = module.aks_kube_config.0.kubernetes_config_client_key
    cluster_ca_certificate = module.aks_kube_config.0.kubernetes_config_cluster_ca_certificate
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
