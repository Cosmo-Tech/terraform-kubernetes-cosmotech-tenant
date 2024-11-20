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
api_deploy            = true
api_helm_chart        = "cosmotech-api-chart"
api_helm_repository   = "oci://ghcr.io/cosmo-tech"
api_helm_release_name = "cosmotech-api"
api_is_multitenant    = true
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
api_list_apikey_allowed = [{
  name           = ""
  apiKey         = ""
  associatedRole = ""
  securedUris    = []
}]
api_persistence_size          = "8Gi"
api_persistence_storage_class = ""
api_identifier_uri            = ""
api_chart_package_version     = ""

# argo workflows
argo_deploy                 = true
argo_helm_repo_url          = "https://charts.bitnami.com/bitnami"
argo_helm_chart             = "argo-workflows"
argo_version                = "9.1.6"
argo_service_account        = ""
s3_endpoint                 = ""
argo_s3_bucket_name         = "argo-workflows"
s3_credentials_secret       = ""
s3_username_key             = ""
s3_password_key             = ""
postgres_release_name       = ""
argo_database               = "argo_workflows"
argo_postgresql_secret_name = "postgres-config"
argo_requeue_time           = "1s"
argo_archive_ttl            = "3d"

# cert-manager
cert_cluster_issuer_name = "letsencrypt-prod"
cert_tls_namespace       = ""
cert_tls_secret_name     = "letsencrypt-prod"

# custom tls
tls_namespace                      = ""
custom_tls_secret_name             = "custom-tls-secret"
custom_tls_certificate_certificate = ""
custom_tls_certificate_key         = ""

# global
monitoring_namespace = "cosmotech-monitoring"
api_dns_name         = ""
monitoring_enabled   = true
tls_certificate_type = ""

# keycloak
keycloak_deploy                     = true
keycloak_client_id                  = ""
keycloak_client_secret              = ""
keycloak_username                   = ""
keycloak_password                   = ""
keycloak_url                        = ""
keycloak_realm_jwt_claim_web_client = "customRoles"
keycloak_realm_jwt_claim_api_client = "customRoles"

# minio
use_minio_storage           = false
minio_argo_access_key       = ""
minio_argo_secret_key       = ""
minio_helm_repo_url         = "https://charts.bitnami.com/bitnami"
minio_helm_chart            = "minio"
minio_version               = "12.1.3"
minio_argo_bucket_name      = "argo-workflows"
minio_argo_persistence_size = "16Gi"
minio_argo_requests_memory  = "2Gi"

# postgres
postgresql_deploy             = true
list_authorized_mime_types = [
  "application/zip",
  "application/xml",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  "application/x-tika-ooxml",
  "text/csv",
  "text/plain",
  "text/x-yaml",
  "application/json",
]
max_file_size    = "1MB"
max_request_size = "10MB"

# Argo
argo_helm_repo_url          = "https://argoproj.github.io/argo-helm"
argo_helm_chart             = "argo-workflows"
argo_helm_chart_version     = "0.16.6"
argo_service_account        = ""
argo_bucket_name            = "argo-workflows"
argo_database               = "argo_workflows"
argo_postgresql_secret_name = "postgres-config"
requeue_time                = "1s"
archive_ttl                 = "3d"
argo_install_crds           = true

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
postgresql_argo_user          = "argo"
postgresql_secret_name        = "postgres-config"
postgresql_argo_database      = "argo_workflows"
postgresql_helm_repo_url      = "https://charts.bitnami.com/bitnami"
postgresql_helm_chart         = "postgresql"
postgresql_version            = "11.6.12"
postgresql_persistence_size   = "8Gi"

# rabbitmq
rabbitmq_deploy             = true
rabbitmq_helm_repo_url      = "https://charts.bitnami.com/bitnami"
rabbitmq_helm_chart         = "rabbitmq"
rabbitmq_helm_chart_version = "13.0.3"
rabbitmq_helm_release_name  = "rabbitmq"
rabbitmq_listener_username  = "cosmotech_api_listener"
rabbitmq_sender_username    = "cosmotech_run_sender"
rabbitmq_persistence_size   = "8Gi"

# redis
redis_deploy            = true
redis_admin_password    = ""
redis_port              = 6379
redis_helm_repo_url     = "https://charts.bitnami.com/bitnami"
redis_helm_release_name = "cosmotechredis"
redis_chart_version     = "17.8.0"
redis_helm_chart_name   = "redis"
redis_pv_capacity       = ""
redis_cosmotech_version = "1.0.12"
redis_persistence_size  = "64Gi"
version_redis_cosmotech = "1.0.12"

# seaweedfs
seaweedfs_chart_version = "4.8.0"

# tenant
tenant_client_id     = ""
tenant_client_secret = ""

# Vault
vault_namespace      = "vault"
vault_address        = "http://vault.vault.svc.cluster.local"
vault_sops_namespace = "vault-secrets-operator"
