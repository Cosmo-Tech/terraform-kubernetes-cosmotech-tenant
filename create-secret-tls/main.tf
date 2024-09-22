resource "kubernetes_secret" "custom-tls" {
  metadata {
    name      = "${var.tls_secret_name}-${var.namespace}"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = var.certificate_cert_content
    "tls.key" = var.certificate_key_content
  }

  type = "kubernetes.io/tls"
}
