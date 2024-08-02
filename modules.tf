module "create-argo" {
  source = "./create-argo"

  namespace             = var.kubernetes_tenant_namespace
  monitoring_namespace  = var.monitoring_namespace
  postgres_release_name = module.create-postgresql-db.out_postgres_release_name
  minio_release_name    = local.use_minio_storage ? module.create-minio.0.out_minio_release_name : ""
  use_minio_storage     = local.use_minio_storage
  archive_ttl                 = var.archive_ttl
  helm_repo_url               = var.argo_helm_repo_url
  helm_chart                  = var.argo_helm_chart
  argo_version                = var.argo_version
  argo_service_account        = var.argo_service_account
  argo_bucket_name            = var.argo_bucket_name
  argo_database               = var.argo_database
  argo_postgresql_secret_name = var.argo_postgresql_secret_name
  requeue_time                = var.requeue_time

  depends_on = [
    module.create-postgresql-db,
    module.create-minio
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

  count                         = var.deploy_api ? 1 : 0
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
  helm_chart                    = var.cosmotech_api_helm_chart
  helm_repository               = var.cosmotech_api_helm_repository
  helm_release_name             = var.cosmotech_api_helm_release_name
  chart_package_version         = var.cosmotech_api_chart_package_version
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
  is_multitenant                = var.is_multitenant

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
  argo_bucket_name            = var.argo_bucket_name
  minio_version               = var.minio_version
  helm_repo_url               = var.minio_helm_repo_url
  helm_chart                  = var.minio_helm_chart
}

module "create-postgresql-db" {
  source = "./create-postgresql-db"

  namespace            = var.kubernetes_tenant_namespace
  monitoring_namespace = var.monitoring_namespace
  persistence_size     = var.postgresql_persistence_size
  postgresql_version            = var.postgresql_version
  helm_repo_url                 = var.postgresql_helm_repo_url
  helm_chart                    = var.postgresql_helm_chart
  argo_database                 = var.argo_database
  cosmotech_api_admin_username  = var.cosmotech_api_admin_username
  cosmotech_api_reader_username = var.cosmotech_api_reader_username
  cosmotech_api_writer_username = var.cosmotech_api_writer_username
  postgresql_initdb_secret_name = var.postgresql_initdb_secret_name
  argo_postgresql_user          = var.argo_postgresql_user
  postgresql_secret_name        = var.postgresql_secret_name
}

module "create-redis-stack" {
  source = "./create-redis-stack"

  redis_admin_password    = random_password.redis_admin_password.result
  namespace               = var.kubernetes_tenant_namespace
  redis_pv_capacity       = var.redis_persistence_size
  helm_repo_url           = var.redis_helm_repo_url
  helm_release_name       = var.redis_helm_release_name
  helm_chart_name         = var.redis_helm_chart_name
  chart_redis_version     = var.redis_chart_version
  version_redis_cosmotech = local.version_redis_cosmotech

  depends_on = [module.create-postgresql-db]
}

module "create-rabbitmq" {
  source = "./create-rabbitmq"

  count = var.create_rabbitmq ? 1 : 0

  namespace            = var.kubernetes_tenant_namespace
  monitoring_namespace = var.monitoring_namespace
  helm_repo_url              = var.rabbitmq_helm_repo_url
  helm_chart                 = var.rabbitmq_helm_chart
  helm_chart_version         = var.rabbitmq_helm_chart_version
  helm_release_name          = var.rabbitmq_helm_release_name
  rabbitmq_listener_username = var.rabbitmq_listener_username
  rabbitmq_sender_username   = var.rabbitmq_sender_username
  persistence_size     = var.rabbitmq_persistence_size
}

module "create-platform-config" {
  source = "./create-platform-config"

  count = var.create_platform_config ? 1 : 0

  namespace                                = var.kubernetes_tenant_namespace
  api_version                              = var.cosmotech_api_version
  acr_server                               = var.acr_login_server
  acr_username                             = var.acr_login_username
  acr_password                             = var.acr_login_password
  acr_registry_url                         = var.acr_registry_url
  host_cosmotech_api                       = var.api_dns_name
  monitoring_namespace                     = var.monitoring_namespace
  azure_tenant_id                          = var.tenant_id
  azure_appid_uri                          = var.identifier_uri
  azure_storage_account_key                = var.storage_account_key
  azure_storage_account_name               = var.storage_account_name
  azure_platform_credentials_client_id     = var.tenant_client_id
  azure_platform_credentials_client_secret = var.tenant_client_secret
  azure_credentials_network_client_id      = var.network_client_id
  azure_credentials_network_client_secret  = var.network_client_secret
  adx_base_uri                             = var.adx_uri
  adx_ingest_uri                           = var.adx_ingestion_uri
  eventbus_base_uri                        = var.eventbus_uri
  identity_authorization_url               = var.identity_authorization_url
  identity_token_url                       = var.identity_token_url
  host_redis_password                      = random_password.redis_admin_password.result
  rds_hub_listener                         = module.create-rabbitmq.0.out_rabbitmq_listener_password
  rds_hub_sender                           = module.create-rabbitmq.0.out_rabbitmq_sender_password
  argo_service_account_name                = module.create-argo.out_argo_workflows_service_account
  rds_storage_admin                        = module.create-postgresql-db.out_postgres_admin_password
  rds_storage_reader                       = module.create-postgresql-db.out_postgres_reader_password
  rds_storage_writer                       = module.create-postgresql-db.out_postgres_writer_password
  host_rds                                 = module.create-rabbitmq.0.out_rabbitmq_svc_name
  host_rds_postgres                        = module.create-postgresql-db.out_postgres_svc_name
  postgres_release_name                    = module.create-postgresql-db.out_postgres_release_name
  argo_release_name                        = module.create-argo.out_argo_workflows_release_name
  host_argo_workflow                       = module.create-argo.out_argo_workflows_svc_name
  host_postgres                            = module.create-postgresql-db.out_postgres_svc_name
  host_redis                               = module.create-redis-stack.out_host_svc_redis

  depends_on = [
    module.create-postgresql-db,
    module.create-argo,
    module.create-rabbitmq,
    module.create-redis-stack
  ]
}
