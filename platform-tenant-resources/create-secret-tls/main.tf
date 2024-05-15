resource "kubernetes_secret" "custom-tls" {
  metadata {
    name      = "${var.tls_secret_name}-${var.namespace}"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = var.tls_certificate_custom_certificate
    "tls.key" = var.tls_certificate_custom_key
  }

  type = "kubernetes.io/tls"
}
