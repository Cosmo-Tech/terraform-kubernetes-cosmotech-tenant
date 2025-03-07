module "create-redis-stack" {
  source = "./create-redis-stack"

  count = var.redis_deploy ? 1 : 0

  namespace                       = var.kubernetes_tenant_namespace
  redis_admin_password            = var.redis_admin_password
  redis_persistence_size          = var.redis_persistence_size
  redis_chart_version             = var.redis_chart_version
  redis_cosmotech_version         = var.redis_cosmotech_version
  helm_chart_name                 = var.redis_helm_chart_name
  helm_release_name               = var.redis_helm_release_name
  helm_repo_url                   = var.redis_helm_repo_url
  redis_master_existing_pvc_name  = var.redis_master_existing_pvc_name
  redis_pvc_storage_class_name    = var.pvc_redis_storage_class_name
  redis_replica_existing_pvc_name = var.redis_replica_existing_pvc_name
  first_tenant_in_cluster         = var.first_tenant_in_cluster
  redis_resources                 = var.redis_resources

  depends_on = [
    module.create-postgresql-db,
    module.deploy-pvc-redis
  ]
}