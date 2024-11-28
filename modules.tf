module "create-argo" {
  source = "./create-argo"

  namespace             = var.kubernetes_tenant_namespace
  monitoring_namespace  = var.monitoring_namespace
  postgres_release_name = module.create-postgresql-db.out_postgres_release_name
  s3_endpoint           = local.use_minio_storage ? local.minio_endpoint : module.create-seaweedfs.0.out_s3_endpoint
  s3_credentials_secret = local.use_minio_storage ? module.create-minio.0.out_minio_release_name : module.create-seaweedfs.0.out_s3_credentials_secret
  s3_username_key       = local.use_minio_storage ? "root-user" : module.create-seaweedfs.0.out_s3_credentials_keys.argo_workflows_username
  s3_password_key       = local.use_minio_storage ? "root-password" : module.create-seaweedfs.0.out_s3_credentials_keys.argo_workflows_password

  depends_on = [
    module.create-postgresql-db,
    module.create-minio,
    module.create-seaweedfs,
    time_sleep.wait_30_seconds
  ]
}

module "cert-manager" {
  source = "./create-cert-manager"

  count               = var.tls_certificate_type == "let_s_encrypt" ? 1 : 0
  namespace           = var.kubernetes_tenant_namespace
  cluster_issuer_name = var.cluster_issuer_name
  tls_secret_name     = local.tls_secret_name
  api_dns_name        = var.api_dns_name
}

module "create-tls" {
  source = "./create-secret-tls"

  count = var.tls_certificate_type == "let_s_encrypt" ? 0 : 1

  namespace                          = var.kubernetes_tenant_namespace
  tls_secret_name                    = var.tls_secret_name
  tls_certificate_custom_certificate = var.tls_certificate_custom_certificate
  tls_certificate_custom_key         = var.tls_certificate_custom_key

  depends_on = [
    module.create-argo
  ]
}

module "create-cosmotech-api" {
  source = "./create-cosmotech-api"

  client_id                     = var.tenant_client_id
  client_secret                 = var.tenant_client_secret
  tenant_id                     = var.tenant_id
  network_client_id             = var.network_client_id
  network_client_secret         = var.network_client_secret
  namespace                     = var.kubernetes_tenant_namespace
  monitoring_enabled            = var.monitoring_enabled
  monitoring_namespace          = var.monitoring_namespace
  api_dns_name                  = var.api_dns_name
  api_replicas                  = var.api_replicas
  tls_secret_name               = local.tls_secret_name
  acr_login_password            = var.acr_login_password
  acr_login_server              = var.acr_login_server
  acr_login_username            = var.acr_login_username
  cosmos_key                    = var.cosmos_key
  cosmos_uri                    = var.cosmos_uri
  adx_uri                       = var.adx_uri
  adx_ingestion_uri             = var.adx_ingestion_uri
  eventbus_uri                  = var.eventbus_uri
  storage_account_key           = var.storage_account_key
  storage_account_name          = var.storage_account_name
  chart_package_version         = var.chart_package_version
  cosmotech_api_version         = var.cosmotech_api_version
  cosmotech_api_version_path    = var.cosmotech_api_version_path
  cosmotech_api_ingress_enabled = var.cosmotech_api_ingress_enabled
  redis_admin_password          = random_password.redis_admin_password.result
  redis_port                    = var.redis_port
  argo_release_name             = module.create-argo.out_argo_workflows_release_name
  argo_service_account          = module.create-argo.out_argo_workflows_service_account
  tenant_resource_group         = var.tenant_resource_group
  use_internal_result_services  = var.create_rabbitmq
  postgresql_release_name       = module.create-postgresql-db.out_postgres_release_name
  postgresql_reader_username    = module.create-postgresql-db.out_postgres_reader_username
  postgresql_reader_password    = module.create-postgresql-db.out_postgres_reader_password
  postgresql_writer_username    = module.create-postgresql-db.out_postgres_writer_username
  postgresql_writer_password    = module.create-postgresql-db.out_postgres_writer_password
  postgresql_admin_username     = module.create-postgresql-db.out_postgres_admin_username
  postgresql_admin_password     = module.create-postgresql-db.out_postgres_admin_password
  rabbitmq_release_name         = var.create_rabbitmq ? module.create-rabbitmq.0.out_rabbitmq_release_name : ""
  rabbitmq_listener_username    = var.create_rabbitmq ? module.create-rabbitmq.0.out_rabbitmq_listener_username : ""
  rabbitmq_listener_password    = var.create_rabbitmq ? module.create-rabbitmq.0.out_rabbitmq_listener_password : ""
  rabbitmq_sender_username      = var.create_rabbitmq ? module.create-rabbitmq.0.out_rabbitmq_sender_username : ""
  rabbitmq_sender_password      = var.create_rabbitmq ? module.create-rabbitmq.0.out_rabbitmq_sender_password : ""
  list_apikey_allowed           = var.list_apikey_allowed
  identifier_uri                = var.identifier_uri
  persistence_size              = var.cosmotech_api_persistence_size
  persistence_storage_class     = var.cosmotech_api_persistence_storage_class
  keycloak_client_id            = module.create-keycloak.0.out_keycloak_client_id
  keycloak_client_secret        = module.create-keycloak.0.out_keycloak_client_secret

  depends_on = [
    module.create-argo,
    module.create-postgresql-db,
    module.create-rabbitmq
  ]
}

module "create-minio" {
  count  = local.use_minio_storage ? 1 : 0
  source = "./create-minio"

  namespace                   = var.kubernetes_tenant_namespace
  monitoring_namespace        = var.monitoring_namespace
  argo_minio_access_key       = random_password.argo_minio_access_key.result
  argo_minio_secret_key       = random_password.argo_minio_secret_key.result
  argo_minio_persistence_size = var.argo_minio_persistence_size
  argo_minio_requests_memory  = var.argo_minio_requests_memory
}

module "create-postgresql-db" {
  source = "./create-postgresql-db"

  namespace            = var.kubernetes_tenant_namespace
  monitoring_namespace = var.monitoring_namespace
  persistence_size     = var.postgresql_persistence_size
}

module "create-redis-stack" {
  source = "./create-redis-stack"

  redis_admin_password    = random_password.redis_admin_password.result
  namespace               = var.kubernetes_tenant_namespace
  depends_on              = [module.create-postgresql-db]
  redis_pv_capacity       = var.redis_persistence_size
  chart_redis_version     = var.chart_redis_version
  version_redis_cosmotech = local.version_redis_cosmotech
}

module "create-rabbitmq" {
  source = "./create-rabbitmq"

  count = var.create_rabbitmq ? 1 : 0

  namespace            = var.kubernetes_tenant_namespace
  monitoring_namespace = var.monitoring_namespace
  persistence_size     = var.rabbitmq_persistence_size
}

module "create-keycloak" {
  source = "./create-keycloak-realm"

  count = var.create_keycloak ? 1 : 0

  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  api_dns_name                = var.api_dns_name

  depends_on = [module.create-argo]
}

module "create-seaweedfs" {
  count  = local.use_minio_storage ? 0 : 1
  source = "./create-seaweedfs"

  namespace                  = var.kubernetes_tenant_namespace
  chart_version              = var.seaweedfs_chart_version
  postgresql_host            = module.create-postgresql-db.out_postgres_release_name
  postgresql_port            = 5432
  postgresql_database        = module.create-postgresql-db.out_postgres_seawweedfs_database
  postgresql_username        = module.create-postgresql-db.out_postgres_seawweedfs_username
  postgresql_password_secret = module.create-postgresql-db.out_postgres_seawweedfs_password_secret

  depends_on = [
    module.create-postgresql-db
  ]
}

module "create-grafana-loki" {
  count  = local.use_minio_storage ? 0 : 1
  source = "./create-grafana-loki"

  namespace                      = var.kubernetes_tenant_namespace
  chart_grafana_loki_version     = var.chart_grafana_loki_version
  grafana_loki_bucket_name       = var.grafana_loki_bucket_name
  grafana_loki_s3_endpoint_url   = module.create-seaweedfs.0.out_s3_endpoint
  grafana_loki_access_key_id     = module.create-seaweedfs.0.out_s3_credentials_keys.grafana_loki_username
  grafana_loki_secret_access_key = module.create-seaweedfs.0.out_s3_credentials_keys.grafana_loki_password

  depends_on = [
    module.create-seaweedfs,
    time_sleep.wait_30_seconds
  ]
}
