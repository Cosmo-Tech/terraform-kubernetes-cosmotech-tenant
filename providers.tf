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
    grafana = {
      source  = "grafana/grafana"
      version = "3.22.0"
    }
  }
  required_version = ">= 1.3.9"
}

provider "grafana" {
  url  = "${var.api_dns_name}/monitoring"
  auth = "${var.grafana_admin_user}:${var.grafana_admin_password}"
}
