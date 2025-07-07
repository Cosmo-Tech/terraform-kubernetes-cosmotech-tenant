module "create-cosmotech-api" {
  source = "./create-cosmotech-api"

  count = var.api_deploy ? 1 : 0

  tls_secret_name               = local.tls_secret_name
  client_id                     = var.tenant_sp_client_id
  client_secret                 = var.tenant_sp_client_secret
  tenant_id                     = var.tenant_id
  tenant_sp_client_id           = var.tenant_sp_client_id
  tenant_sp_client_secret       = var.tenant_sp_client_secret
  network_sp_client_id          = var.network_sp_client_id
  network_sp_client_secret      = var.network_sp_client_secret
  kubernetes_tenant_namespace   = var.kubernetes_tenant_namespace
  monitoring_enabled            = var.monitoring_enabled
  monitoring_namespace          = var.monitoring_namespace
  api_dns_name                  = var.api_dns_name
  api_replicas                  = var.api_replicas
  acr_login_password            = var.api_acr_login_password
  acr_login_server              = var.api_acr_login_server
  acr_login_username            = var.api_acr_login_username
  adx_uri                       = var.api_adx_uri
  adx_ingestion_uri             = var.api_adx_ingestion_uri
  eventbus_uri                  = var.api_eventbus_uri
  storage_account_key           = var.api_storage_account_key
  storage_account_name          = var.api_storage_account_name
  chart_package_version         = var.api_chart_package_version
  cosmotech_api_version         = var.api_version
  cosmotech_api_version_path    = var.api_version_path
  cosmotech_api_ingress_enabled = var.api_ingress_enabled
  redis_port                    = var.redis_port
  tenant_resource_group         = var.tenant_resource_group
  list_authorized_mime_types    = var.api_list_authorized_mime_types
  max_file_size                 = var.api_max_file_size
  max_request_size              = var.api_max_request_size
  use_internal_result_services  = var.rabbitmq_deploy
  redis_admin_password          = var.redis_deploy ? module.create-redis-stack.0.out_redis_admin_password : var.redis_admin_password
  rabbitmq_release_name         = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_release_name : var.rabbitmq_helm_release_name
  rabbitmq_listener_username    = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_listener_username : var.rabbitmq_listener_username
  rabbitmq_listener_password    = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_listener_password : ""
  rabbitmq_sender_username      = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_sender_username : var.rabbitmq_sender_username
  rabbitmq_sender_password      = var.rabbitmq_deploy ? module.create-rabbitmq.0.out_rabbitmq_sender_password : ""
  s3_endpoint_url               = !var.minio_deploy ? module.create-seaweedfs.0.out_s3_endpoint : ""
  s3_bucket_name                = !var.minio_deploy ? "cosmotech-api" : ""
  list_apikey_allowed           = var.api_list_apikey_allowed
  identifier_uri                = var.api_identifier_uri
  keycloak_client_id            = var.keycloak_deploy ? module.create-keycloak.0.out_keycloak_api_client_id : var.keycloak_client_id
  keycloak_client_secret        = var.keycloak_deploy ? module.create-keycloak.0.out_keycloak_api_client_secret : var.keycloak_client_secret
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
  api_graph_enabled             = var.api_graph_enabled
  api_identity_provider         = var.api_identity_provider
  api_auth_provider             = var.api_auth_provider

  depends_on = [
    module.create-argo,
    module.create-postgresql-db,
    module.create-rabbitmq,
    module.create-redis-stack,
    module.create-keycloak,
  ]
}