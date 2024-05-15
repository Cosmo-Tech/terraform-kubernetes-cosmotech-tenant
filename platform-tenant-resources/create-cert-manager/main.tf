terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

locals {
  values_cert_manager = {
    "CERT_MANAGER_ACME"      = var.cluster_issuer_name
    "TLS_SECRET_NAME"        = local.tls_secret_name
    "COSMOTECH_API_DNS_NAME" = var.api_dns_name
    "NAMESPACE"              = var.namespace
  }
  tls_secret_name = "${var.tls_secret_name}-${var.namespace}"
}

resource "kubectl_manifest" "certificates" {
  validate_schema = false
  yaml_body       = templatefile("${path.module}/values-certificate.yaml", local.values_cert_manager)
}