module "create-argo" {
  source = "./create-argo"

  count = var.argo_deploy ? 1 : 0

  namespace                   = var.kubernetes_tenant_namespace
  monitoring_namespace        = var.monitoring_namespace
  postgres_argo_user          = module.create-postgresql-db.0.out_argo_postgresql_user
  postgres_release_name       = module.create-postgresql-db.0.out_postgres_release_name
  s3_endpoint                 = var.use_minio_storage ? local.minio_endpoint : module.create-seaweedfs.0.out_s3_endpoint
  s3_credentials_secret       = var.use_minio_storage ? module.create-minio.0.out_minio_release_name : module.create-seaweedfs.0.out_s3_credentials_secret
  s3_username_key             = var.use_minio_storage ? "root-user" : module.create-seaweedfs.0.out_s3_credentials_keys.argo_workflows_username
  s3_password_key             = var.use_minio_storage ? "root-password" : module.create-seaweedfs.0.out_s3_credentials_keys.argo_workflows_password
  archive_ttl                 = var.argo_archive_ttl
  minio_release_name          = local.use_minio_storage ? module.create-minio.0.out_minio_release_name : ""
  use_minio_storage           = local.use_minio_storage
  argo_bucket_name            = var.argo_bucket_name
  argo_database               = var.argo_database
  argo_postgresql_secret_name = var.argo_postgresql_secret_name
  argo_service_account        = var.argo_service_account
  argo_version                = var.argo_version
  helm_chart                  = var.argo_helm_chart
  helm_repo_url               = var.argo_helm_repo_url
  requeue_time                = var.argo_requeue_time
  s3_bucket_name              = var.argo_s3_bucket_name
  argo_bucket_name            = var.argo_bucket_name

  depends_on = [
    module.create-postgresql-db,
    module.create-minio,
    module.create-seaweedfs,
    module.create-minio
  ]
}

module "cert-manager" {
  source = "./create-cert-manager"

  count = var.cert_deploy ? 1 : 0

  tls_secret_name     = local.tls_secret_name
  namespace           = var.kubernetes_tenant_namespace
  cluster_issuer_name = var.cert_cluster_issuer_name
  tls_secret_name     = local.tls_secret_name
  api_dns_name        = var.api_dns_name
}

module "create-tls" {
  source = "./create-secret-tls"

  count = var.tls_deploy ? 1 : 0

  namespace                          = var.kubernetes_tenant_namespace
  tls_secret_name                    = var.custom_tls_secret_name
  tls_certificate_custom_certificate = var.custom_tls_certificate_certificate
  tls_certificate_custom_key         = var.custom_tls_certificate_key

  depends_on = [
    module.create-argo
  ]
}

module "create-keycloak" {
  source = "./create-keycloak-realm"

  count = var.keycloak_deploy ? 1 : 0

  kubernetes_tenant_namespace         = var.kubernetes_tenant_namespace
  api_dns_name                        = var.api_dns_name
  keycloak_realm_jwt_claim_api_client = var.keycloak_realm_jwt_claim_api_client
  keycloak_realm_jwt_claim_web_client = var.keycloak_realm_jwt_claim_web_client

  depends_on = [module.create-argo]
}

module "create-cosmotech-api" {
  source = "./create-cosmotech-api"

  count = var.api_deploy ? 1 : 0

  client_id                     = var.tenant_sp_client_id
  client_secret                 = var.tenant_sp_client_secret
  tenant_id                     = var.tenant_id
  network_sp_client_id          = var.network_sp_client_id
  network_sp_client_secret      = var.network_sp_client_secret
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace
  monitoring_enabled            = var.monitoring_enabled
  monitoring_namespace          = var.monitoring_namespace
  api_dns_name                  = var.api_dns_name
  api_replicas                  = var.api_replicas
  acr_login_password            = var.acr_login_password
  acr_login_server              = var.acr_login_server
  acr_login_username            = var.acr_login_username
  adx_uri                       = var.adx_uri
  adx_ingestion_uri             = var.adx_ingestion_uri
  eventbus_uri                  = var.eventbus_uri
  storage_account_key           = var.storage_account_key
  storage_account_name          = var.storage_account_name
  chart_package_version         = var.api_chart_package_version
  cosmotech_api_version         = var.api_version
  cosmotech_api_version_path    = var.api_version_path
  helm_chart                    = var.cosmotech_api_helm_chart
  helm_repository               = var.cosmotech_api_helm_repository
  helm_release_name             = var.cosmotech_api_helm_release_name
  cosmotech_api_ingress_enabled = var.cosmotech_api_ingress_enabled
  redis_port                    = var.redis_port
  tenant_resource_group         = var.tenant_resource_group
  use_internal_result_services  = var.rabbitmq_deploy
  redis_admin_password          = var.redis_deploy ? module.create-redis-stack.0.out_redis_admin_password : ""
  rabbitmq_release_name         = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_release_name : ""
  rabbitmq_listener_username    = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_listener_username : ""
  rabbitmq_listener_password    = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_listener_password : ""
  rabbitmq_sender_username      = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_sender_username : ""
  rabbitmq_sender_password      = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_sender_password : ""
  list_apikey_allowed           = var.api_list_apikey_allowed
  identifier_uri                = var.api_identifier_uri
  persistence_size              = var.api_persistence_size
  persistence_storage_class     = var.api_persistence_storage_class
  keycloak_client_id            = module.create-keycloak.0.out_keycloak_api_client_id
  keycloak_client_secret        = module.create-keycloak.0.out_keycloak_api_client_secret
  helm_chart                    = var.api_helm_chart
  helm_release_name             = var.api_helm_release_name
  helm_repository               = var.api_helm_repository
  is_multitenant                = var.api_is_multitenant
  argo_release_name             = var.argo_deploy ? module.create-argo.0.out_argo_workflows_release_name : ""
  argo_service_account          = var.argo_deploy ? module.create-argo.0.out_argo_workflows_service_account : ""
  postgresql_release_name       = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_release_name : ""
  postgresql_reader_username    = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_reader_username : ""
  postgresql_reader_password    = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_reader_password : ""
  postgresql_writer_username    = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_writer_username : ""
  postgresql_writer_password    = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_writer_password : ""
  postgresql_admin_username     = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_admin_username : ""
  postgresql_admin_password     = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_admin_password : ""

  depends_on = [
    module.create-argo,
    module.create-postgresql-db,
    module.create-rabbitmq,
    module.create-redis-stack,
    module.create-keycloak
  ]
}

module "create-minio" {
  source = "./create-minio"

  count = var.minio_deploy ? 1 : 0

  namespace                   = var.kubernetes_tenant_namespace
  monitoring_namespace        = var.monitoring_namespace
  argo_minio_access_key       = random_password.argo_minio_access_key.result
  argo_minio_secret_key       = random_password.argo_minio_secret_key.result
  argo_minio_persistence_size = var.minio_argo_persistence_size
  argo_minio_requests_memory  = var.minio_argo_requests_memory
  argo_bucket_name            = var.minio_argo_bucket_name

  helm_chart                  = var.minio_helm_chart
  helm_repo_url               = var.minio_helm_repo_url
  minio_version               = var.minio_version
}

module "create-postgresql-db" {
  source = "./create-postgresql-db"

  count = var.postgresql_deploy ? 1 : 0

  namespace                     = var.kubernetes_tenant_namespace
  monitoring_namespace          = var.monitoring_namespace
  persistence_size              = var.postgresql_persistence_size
  argo_database                 = var.postgresql_argo_database
  argo_postgresql_user          = var.postgresql_argo_user
  cosmotech_api_admin_username  = var.postgresql_cosmotech_api_admin_username
  cosmotech_api_reader_username = var.postgresql_cosmotech_api_reader_username
  cosmotech_api_writer_username = var.postgresql_cosmotech_api_reader_username
  helm_chart                    = var.postgresql_helm_chart
  helm_repo_url                 = var.postgresql_helm_repo_url
  postgresql_initdb_secret_name = var.postgresql_initdb_secret_name
  postgresql_secret_name        = var.postgresql_secret_name
  postgresql_version            = var.postgresql_version
  create_secrets_config         = var.create_secrets_config
}

module "create-redis-stack" {
  source = "./create-redis-stack"

  count = var.redis_deploy ? 1 : 0

  redis_admin_password    = random_password.redis_admin_password.result
  namespace               = var.kubernetes_tenant_namespace
  redis_pv_capacity       = var.redis_persistence_size
  chart_redis_version     = var.redis_chart_version
  version_redis_cosmotech = var.redis_cosmotech_version
  helm_chart_name         = var.redis_helm_chart_name
  helm_release_name       = var.redis_helm_release_name
  helm_repo_url           = var.redis_helm_repo_url

  depends_on = [module.create-argo]
}

module "create-rabbitmq" {
  source = "./create-rabbitmq"

  count = var.rabbitmq_deploy ? 1 : 0

  namespace                  = var.kubernetes_tenant_namespace
  monitoring_namespace       = var.monitoring_namespace
  persistence_size           = var.rabbitmq_persistence_size
  helm_chart                 = var.rabbitmq_helm_chart
  helm_chart_version         = var.rabbitmq_helm_chart_version
  helm_release_name          = var.rabbitmq_helm_release_name
  helm_repo_url              = var.rabbitmq_helm_repo_url
  rabbitmq_listener_username = var.rabbitmq_listener_username
  rabbitmq_sender_username   = var.rabbitmq_sender_username
}

module "create-seaweedfs" {
  count  = var.use_minio_storage ? 0 : 1
  source = "./create-seaweedfs"

  namespace                  = var.kubernetes_tenant_namespace
  chart_version              = var.seaweedfs_chart_version
  postgresql_host            = module.create-postgresql-db.0.out_postgres_release_name
  postgresql_port            = 5432
  postgresql_database        = module.create-postgresql-db.0.out_postgres_seawweedfs_database
  postgresql_username        = module.create-postgresql-db.0.out_postgres_seawweedfs_username
  postgresql_password_secret = module.create-postgresql-db.0.out_postgres_seawweedfs_password_secret

  depends_on = [
    module.create-postgresql-db
  ]
}

module "config_vault" {
  source = "./config-vault"

  count = var.create_platform_config ? 1 : 0

  allowed_namespace    = var.allowed_namespace
  cluster_name         = var.cluster_name
  tenant_id            = var.tenant_id
  vault_address        = var.vault_address
  vault_namespace      = var.vault_namespace
  vault_sops_namespace = var.vault_sops_namespace
  organization         = var.organization
  persistence_size           = var.rabbitmq_persistence_size
  create_rabbitmq_secret     = var.create_rabbitmq_secret
}

module "config_platform" {
  source = "./config-platform"

  count = var.create_platform_config ? 1 : 0

  api_version                              = var.cosmotech_api_version
  acr_server                               = var.acr_login_server
  acr_username                             = var.acr_login_username
  acr_password                             = var.acr_login_password
  acr_registry_url                         = var.acr_login_server_url
  host_cosmotech_api                       = var.api_dns_name
  monitoring_namespace                     = var.monitoring_namespace
  azure_tenant_id                          = var.tenant_id
  azure_appid_uri                          = var.identifier_uri
  azure_storage_account_key                = var.storage_account_key
  azure_storage_account_name               = var.storage_account_name
  azure_credentials_platform_client_id     = var.tenant_sp_client_id
  azure_credentials_platform_client_secret = var.tenant_sp_client_secret
  azure_credentials_network_client_id      = var.network_sp_client_id
  azure_credentials_network_client_secret  = var.network_sp_client_secret
  adx_base_uri                             = var.adx_uri
  adx_ingest_uri                           = var.adx_ingestion_uri
  eventbus_base_uri                        = var.eventbus_uri
  identity_authorization_url               = var.identity_authorization_url
  identity_token_url                       = var.identity_token_url
  vault_address                            = var.vault_address
  vault_namespace                          = var.vault_namespace
  cluster_name                             = var.cluster_name
  kubernetes_tenant_namespace              = var.kubernetes_tenant_namespace
  host_redis_password                      = var.redis_admin_password
  rds_hub_listener                         = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_listener_password : ""
  rds_hub_sender                           = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_sender_password : ""
  host_rds                                 = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_svc_name : ""
  rds_storage_admin                        = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_admin_password : ""
  rds_storage_reader                       = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_reader_password : ""
  rds_storage_writer                       = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_writer_password : ""
  host_rds_postgres                        = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_svc_name : ""
  postgres_release_name                    = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_release_name : ""
  host_postgres                            = var.postgresql_deploy ? module.create-postgresql-db.0.out_postgres_svc_name : ""
  argo_service_account_name                = var.argo_deploy ? module.create-argo.0.out_argo_workflows_service_account : ""
  argo_release_name                        = var.argo_deploy ? module.create-argo.0.out_argo_workflows_release_name : ""
  host_argo_workflow                       = var.argo_deploy ? module.create-argo.0.out_argo_workflows_svc_name : ""
  host_redis                               = var.redis_deploy ? module.create-redis-stack.0.out_host_svc_redis : ""

  depends_on = [
    module.create-postgresql-db,
    module.create-argo,
    module.create-rabbitmq,
    module.create-redis-stack
  ]
}
