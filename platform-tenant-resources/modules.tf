module "create-argo" {
  source = "./create-argo"

  namespace             = var.kubernetes_tenant_namespace
  monitoring_namespace  = var.monitoring_namespace
  postgres_release_name = module.create-postgresql-db.out_postgres_release_name

  depends_on = [
    module.create-postgresql-db
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

  depends_on = [
    module.create-argo,
    module.create-postgresql-db,
    module.create-rabbitmq
  ]
}

module "create-minio" {
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
  depends_on           = [module.create-minio]
}

module "create-redis-stack" {
  source = "./create-redis-stack"

  redis_admin_password = random_password.redis_admin_password.result
  namespace            = var.kubernetes_tenant_namespace
  managed_disk_id      = var.managed_disk_id
  redis_disk_name      = var.redis_disk_name
  depends_on           = [module.create-postgresql-db]

}

module "create-rabbitmq" {
  source = "./create-rabbitmq"

  count = var.create_rabbitmq ? 1 : 0

  namespace            = var.kubernetes_tenant_namespace
  monitoring_namespace = var.monitoring_namespace
}
