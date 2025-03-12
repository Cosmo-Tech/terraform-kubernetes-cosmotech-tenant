module "create-seaweedfs" {
  source = "./create-seaweedfs"

  count = var.minio_deploy ? 0 : 1

  namespace                          = var.kubernetes_tenant_namespace
  helm_chart_repository              = var.seaweedfs_helm_chart_repository
  helm_chart_name                    = var.seaweedfs_helm_chart_name
  helm_chart_version                 = var.seaweedfs_helm_chart_version
  postgresql_port                    = var.seaweedfs_postgresql_port
  postgresql_host                    = module.create-postgresql-db.0.out_postgres_release_name
  postgresql_database                = module.create-postgresql-db.0.out_postgres_seawweedfs_database
  postgresql_username                = module.create-postgresql-db.0.out_postgres_seawweedfs_username
  postgresql_password_secret         = module.create-postgresql-db.0.out_postgres_seawweedfs_password_secret
  seaweedfs_master_pvc_size          = var.pvc_seaweedfs_storage_gbi
  seaweedfs_volume_pvc_size          = var.pvc_seaweedfs_storage_gbi
  seaweedfs_pvc_accessmode           = var.pvc_seaweedfs_storage_accessmode
  seaweedfs_pvc_storageclass_name    = var.pvc_seaweedfs_storage_class_name
  seaweedfs_master_existing_pvc_name = var.seaweedfs_master_existing_pvc_name
  seaweedfs_volume_existing_pvc_name = var.seaweedfs_volume_existing_pvc_name

  depends_on = [
    module.create-postgresql-db
  ]
}
