module "deploy-pvc-redis" {
  source = "./persistence-claim-redis"

  count = var.pvc_redis_deploy ? 1 : 0

  kubernetes_tenant_namespace  = var.kubernetes_tenant_namespace
  pvc_redis_replicas           = var.pvc_redis_replicas
  pvc_redis_storage_gbi        = var.pvc_redis_storage_gbi
  pvc_redis_storage_class_name = var.pvc_redis_storage_class_name
  pvc_redis_storage_accessmode = var.pvc_redis_storage_accessmode
  pvc_redis_disk_master_name   = var.pvc_redis_disk_master_name
  pvc_redis_disk_replica_name  = var.pvc_redis_disk_replica_name
}
