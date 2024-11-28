locals {
  values_grafana_loki = {
    "BUCKET_NAME"       = var.grafana_loki_bucket_name
    "S3_ENDPOINT_URL"   = var.grafana_loki_s3_endpoint_url
    "ACCESS_KEY_ID"     = var.grafana_loki_access_key_id
    "SECRET_ACCESS_KEY" = var.grafana_loki_secret_access_key
  }
}

locals {
  instance_name = "${var.helm_release_name}-${var.namespace}"
}

resource "helm_release" "grafana_loki" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  version    = var.chart_grafana_loki_version
  namespace  = var.namespace

  reuse_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_grafana_loki)
  ]
}
