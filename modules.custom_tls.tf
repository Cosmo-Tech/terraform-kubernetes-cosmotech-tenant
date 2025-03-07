module "create-tls" {
  source = "./create-secret-tls"

  count = var.tls_certificate_type == "custom" ? 1 : 0

  namespace                          = var.kubernetes_tenant_namespace
  tls_secret_name                    = var.custom_tls_secret_name
  tls_certificate_custom_certificate = var.custom_tls_certificate_certificate
  tls_certificate_custom_key         = var.custom_tls_certificate_key

  depends_on = [
    module.create-argo
  ]
}
