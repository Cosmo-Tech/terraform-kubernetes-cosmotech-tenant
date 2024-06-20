locals {
  values_redis = {
    "REDIS_PASSWORD"          = var.redis_admin_password
    "VERSION_REDIS_COSMOTECH" = var.version_redis_cosmotech
    "REDIS_DISK_SIZE"         = var.redis_pv_capacity
  }
}

locals {
  instance_name = "${var.helm_release_name}-${var.namespace}"
}

resource "helm_release" "cosmotechredis" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  version    = var.chart_redis_version
  namespace  = var.namespace

  reuse_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_redis)
  ]
}