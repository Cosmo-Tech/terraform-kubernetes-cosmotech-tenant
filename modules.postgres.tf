module "create-postgresql-db" {
  source = "./create-postgresql-db"

  count = var.postgresql_deploy ? 1 : 0

  namespace                         = var.kubernetes_tenant_namespace
  monitoring_namespace              = var.monitoring_namespace
  persistence_size                  = var.postgresql_persistence_size
  argo_database                     = var.postgresql_argo_database
  argo_postgresql_user              = var.postgresql_argo_user
  cosmotech_api_admin_username      = var.postgresql_cosmotech_api_admin_username
  cosmotech_api_reader_username     = var.postgresql_cosmotech_api_reader_username
  cosmotech_api_writer_username     = var.postgresql_cosmotech_api_writer_username
  helm_chart                        = var.postgresql_helm_chart
  helm_repo_url                     = var.postgresql_helm_repo_url
  postgresql_initdb_secret_name     = var.postgresql_initdb_secret_name
  postgresql_secret_name            = var.postgresql_secret_name
  postgresql_version                = var.postgresql_version
  postgresql_secrets_config_create  = var.postgresql_secrets_config_create
  postgresql_existing_pvc_name      = var.postgresql_existing_pvc_name
  postgresql_pvc_storage_class_name = var.pvc_postgres_storage_class_name
  seaweedfs_database                = var.seaweedfs_database
  seaweedfs_username                = var.seaweedfs_username

  depends_on = [module.deploy-pvc-postgres]
}