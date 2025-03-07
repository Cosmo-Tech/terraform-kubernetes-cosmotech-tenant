module "cert-manager" {
  source = "./create-cert-manager"

  count = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0

  namespace           = var.kubernetes_tenant_namespace
  tls_secret_name     = local.tls_secret_name
  cluster_issuer_name = var.cert_cluster_issuer_name
  api_dns_name        = var.api_dns_name
}
