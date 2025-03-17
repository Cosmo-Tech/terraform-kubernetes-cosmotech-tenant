locals {
  local_redis_admin_password = var.redis_admin_password == "" ? data.kubernetes_secret.redis_secret.data.password : var.redis_admin_password
  values_redis = {
    "REDIS_PASSWORD"                   = local.local_redis_admin_password
    "VERSION_REDIS_COSMOTECH"          = var.redis_cosmotech_version
    "REDIS_DISK_SIZE"                  = var.redis_persistence_size
    "REDIS_MASTER_EXISTING_PVC_NAME"   = var.redis_master_existing_pvc_name
    "REDIS_MASTER_STORAGE_CLASS_NAME"  = var.redis_pvc_storage_class_name
    "REDIS_REPLICA_EXISTING_PVC_NAME"  = var.redis_replica_existing_pvc_name
    "REDIS_REPLICA_STORAGE_CLASS_NAME" = var.redis_pvc_storage_class_name
    "REDIS_RESOURCES"                  = jsonencode(var.redis_resources)
  }
  instance_name = "${var.helm_release_name}-${var.namespace}"
}

data "kubernetes_secret" "redis_secret" {
  metadata {
    name      = var.first_tenant_in_cluster ? "prom-redis-datasource" : "redis-admin-secret"
    namespace = var.first_tenant_in_cluster ? "default" : var.namespace
  }
}

resource "helm_release" "cosmotechredis" {
  name       = local.instance_name
  repository = var.helm_repo_url
  chart      = var.helm_chart_name
  version    = var.redis_chart_version
  namespace  = var.namespace

  reset_values = true
  wait         = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values.yaml", local.values_redis)
  ]
}
