# Azure
network_sp_client_secret = ""
storage_account_key      = ""
storage_account_name     = ""
acr_login_password       = ""
acr_login_server         = ""
acr_login_username       = ""
adx_ingestion_uri        = ""
adx_uri                  = ""
eventbus_uri             = ""

# Platform config
identity_authorization_url = ""
identity_token_url         = ""
acr_login_server_url       = ""

# Cert-manager
cluster_issuer_name      = "letsencrypt-prod"
tls_secret_name          = "letsencrypt-prod"
tls_certificate_type     = "let_s_encrypt"
certificate_cert_content = ""
certificate_key_content  = ""
secret_tls_secret_name   = "custom-tls-secret"

# Cosmotech API
cosmotech_api_helm_chart                = "cosmotech-api-chart"
cosmotech_api_helm_repository           = "oci://ghcr.io/cosmo-tech"
cosmotech_api_helm_release_name         = "cosmotech-api"
is_multitenant                          = true
monitoring_enabled                      = true
monitoring_namespace                    = "cosmotech-monitoring"
api_replicas                            = 1
cosmotech_api_ingress_enabled           = true
cosmotech_api_persistence_size          = "8Gi"
cosmotech_api_persistence_storage_class = ""
list_apikey_allowed = [{
  name           = ""
  apiKey         = ""
  associatedRole = ""
  securedUris    = []
}]

# Argo
argo_helm_repo_url          = "https://argoproj.github.io/argo-helm"
argo_helm_chart             = "argo-workflows"
argo_version                = "0.16.6"
argo_service_account        = ""
argo_bucket_name            = "argo-workflows"
argo_database               = "argo_workflows"
argo_postgresql_secret_name = "postgres-config"
requeue_time                = "1s"
archive_ttl                 = "3d"

# MinIO
argo_minio_persistence_size = "16Gi"
argo_minio_requests_memory  = "2Gi"
minio_helm_repo_url         = "https://charts.bitnami.com/bitnami"
minio_helm_chart            = "minio"
minio_version               = "12.1.3"
argo_minio_secret_key       = ""
argo_minio_access_key       = ""

# Postgres
postgresql_deploy             = true
postgresql_persistence_size   = "8Gi"
postgresql_version            = "11.6.12"
postgresql_helm_repo_url      = "https://charts.bitnami.com/bitnami"
postgresql_helm_chart         = "postgresql"
cosmotech_api_reader_username = "cosmotech_api_reader"
cosmotech_api_writer_username = "cosmotech_api_writer"
cosmotech_api_admin_username  = "cosmotech_api_admin"
postgresql_initdb_secret_name = "postgres-initdb"
argo_postgresql_user          = "argo"
postgresql_secret_name        = "postgres-config"

# Rabbitmq
rabbitmq_deploy             = true
rabbitmq_helm_repo_url      = "https://charts.bitnami.com/bitnami"
rabbitmq_helm_chart         = "rabbitmq"
rabbitmq_helm_chart_version = "13.0.3"
rabbitmq_helm_release_name  = "rabbitmq"
rabbitmq_listener_username  = "cosmotech_api_listener"
rabbitmq_sender_username    = "cosmotech_run_sender"
rabbitmq_persistence_size   = "8Gi"

# Redis
redis_helm_repo_url     = "https://charts.bitnami.com/bitnami"
redis_helm_release_name = "cosmotechredis"
redis_helm_chart_name   = "redis"
redis_chart_version     = "17.8.0"
redis_persistence_size  = "64Gi"
redis_port              = 6379
redis_admin_password    = ""

# Vault
vault_namespace      = "vault"
vault_address        = "http://vault.vault.svc.cluster.local"
vault_sops_namespace = "vault-secrets-operator"
