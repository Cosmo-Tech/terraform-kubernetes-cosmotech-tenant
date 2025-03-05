# kube
kube_config                       = ""
kube_context                      = ""
cloud_provider                    = "azure"
kubernetes_cluster_admin_activate = false
kubernetes_tenant_namespace       = ""

# global
api_dns_name         = ""
monitoring_namespace = "cosmotech-monitoring"
monitoring_enabled   = true

# Azure
client_id                 = ""
client_secret             = ""
network_sp_client_secret  = ""
tf_access_key             = ""
tf_container_name         = ""
tf_blob_name_tenant_infra = ""
tf_resource_group_name    = ""
tf_storage_account_name   = ""

# tenant
tenant_sp_client_secret = ""
tenant_resource_group   = ""

# cert-manager
cert_cluster_issuer_name = "letsencrypt-prod"
cert_tls_namespace       = "cert-manager"
cert_tls_secret_name     = "letsencrypt-prod"
tls_certificate_type     = "let_s_encrypt"
certificate_cert_content = ""
certificate_key_content  = ""
secret_tls_secret_name   = "custom-tls-secret"

# custom tls
custom_tls_namespace               = "cert-manager"
custom_tls_secret_name             = "custom-tls-secret"
custom_tls_certificate_certificate = ""
custom_tls_certificate_key         = ""

# Cosmotech API
api_deploy                    = true
api_version                   = ""
api_version_path              = ""
api_helm_chart                = "cosmotech-api-chart"
api_helm_repository           = "oci://ghcr.io/cosmo-tech"
api_helm_release_name         = "cosmotech-api"
api_is_multitenant            = true
api_replicas                  = 1
api_ingress_enabled           = true
api_persistence_size          = "8Gi"
api_persistence_storage_class = ""
api_identifier_uri            = ""
api_chart_package_version     = ""
api_max_file_size             = "1MB"
api_max_request_size          = "10MB"
api_graph_enabled             = true
api_adx_uri                   = ""
api_acr_login_server_url      = ""
api_acr_login_password        = ""
api_acr_login_server          = ""
api_acr_login_username        = ""
api_adx_ingestion_uri         = ""
api_eventbus_uri              = ""
api_storage_account_key       = ""
api_storage_account_name      = ""
api_identity_provider         = {}
api_list_apikey_allowed = [{
  name           = ""
  apiKey         = ""
  associatedRole = ""
  securedUris    = []
}]
api_list_authorized_mime_types = [
  "application/zip",
  "application/xml",
  "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  "application/x-tika-ooxml",
  "text/csv",
  "text/plain",
  "text/x-yaml",
  "application/json",
]
api_auth_provider = "azure"

# keycloak
keycloak_deploy                      = false
keycloak_client_id                   = "admin-cli"
keycloak_url                         = "https://kubernetes.cosmotech.com/keycloak"
keycloak_username                    = "admin-cosmo"
keycloak_client_secret               = ""
keycloak_realm_jwt_claim_web_client  = "customRoles"
keycloak_realm_jwt_claim_api_client  = "customRoles"
keycloak_add_identity_provider_azure = false
keycloak_user_app_role = [
  "Organization User",
  "Platform.Admin"
]



# keycloak

# argo workflows
argo_deploy                 = true
argo_helm_repo_url          = "https://charts.bitnami.com/bitnami"
argo_helm_chart             = "argo-workflows"
argo_helm_chart_version     = "9.1.6"
argo_service_account        = ""
argo_s3_endpoint            = ""
argo_s3_bucket_name         = "argo-workflows"
argo_s3_credentials_secret  = ""
argo_s3_username_key        = ""
argo_s3_password_key        = ""
argo_database               = "argo_workflows"
argo_postgresql_secret_name = "postgres-config"
argo_requeue_time           = "1s"
argo_archive_ttl            = "3d"
argo_bucket_name            = "argo-workflows"
argo_postgres_release_name  = ""
argo_install_crds           = true
argo_cloud_provider         = "azure"

# minio
minio_deploy                = true
minio_helm_repo_url         = "https://charts.bitnami.com/bitnami"
minio_helm_chart            = "minio"
minio_version               = "12.1.3"
minio_argo_access_key       = ""
minio_argo_secret_key       = ""
minio_argo_bucket_name      = "argo-workflows"
minio_argo_persistence_size = "16Gi"
minio_argo_requests_memory  = "2Gi"
minio_existing_pvc_name     = "pvc-disk-minio-tenant"
minio_requests_memory       = ""

# postgres
postgresql_deploy                        = true
postgresql_persistence_size              = "8Gi"
postgresql_version                       = "11.6.12"
postgresql_helm_repo_url                 = "https://charts.bitnami.com/bitnami"
postgresql_helm_chart                    = "postgresql"
postgresql_cosmotech_api_reader_username = "cosmotech_api_reader"
postgresql_cosmotech_api_writer_username = "cosmotech_api_writer"
postgresql_cosmotech_api_admin_username  = "cosmotech_api_admin"
postgresql_initdb_secret_name            = "postgres-initdb"
postgresql_argo_user                     = "argo"
postgresql_secret_name                   = "postgres-config"
postgresql_argo_database                 = "argo_workflows"
postgresql_existing_pvc_name             = "pv-disk-postgres-tenant"
postgresql_secrets_config_create         = false

# rabbitmq
rabbitmq_deploy             = true
rabbitmq_helm_repo_url      = "https://charts.bitnami.com/bitnami"
rabbitmq_helm_chart         = "rabbitmq"
rabbitmq_helm_chart_version = "13.0.3"
rabbitmq_helm_release_name  = "rabbitmq"
rabbitmq_listener_username  = "cosmotech_api_listener"
rabbitmq_sender_username    = "cosmotech_run_sender"
rabbitmq_persistence_size   = "8Gi"
rabbitmq_namespace          = ""
create_rabbitmq_secret      = false

# redis
redis_deploy                    = true
redis_admin_password            = ""
redis_port                      = 6379
redis_helm_repo_url             = "https://charts.bitnami.com/bitnami"
redis_helm_release_name         = "cosmotechredis"
redis_chart_version             = "17.8.0"
redis_helm_chart_name           = "redis"
redis_cosmotech_version         = "1.0.12"
redis_persistence_size          = "64Gi"
redis_master_existing_pvc_name  = "pvc-disk-redis-master-tenant"
redis_replica_existing_pvc_name = "pvc-disk-redis-replica-tenant"
first_tenant_in_cluster         = false
redis_pvc_storage_class_name    = ""
redis_resources = {
  limits = {
    cpu    = "2000m"
    memory = "16Gi"
  }
  requests = {
    cpu    = "1000m"
    memory = "8Gi"
  }
}

# seaweedfs
seaweedfs_helm_chart_repository = "https://charts.bitnami.com/bitnami"
seaweedfs_helm_chart_version    = "3.0.4"
seaweedfs_helm_chart_name       = "seaweedfs"
seaweedfs_postgresql_port       = 5432
seaweedfs_database              = "seaweedfs"
seaweedfs_username              = "seaweedfs"

# Vault
vault_deploy            = false
vault_namespace         = "vault"
vault_address           = "http://vault.vault.svc.cluster.local"
vault_sops_namespace    = "vault-secrets-operator"
vault_allowed_namespace = ""
vault_engine_secret     = "cosmotech"
vault_organization      = "cosmotech"

# pvc redis
pvc_redis_deploy             = false
pvc_redis_replicas           = 1
pvc_redis_storage_gbi        = "128Gi"
pvc_redis_storage_class_name = ""
pvc_redis_storage_accessmode = "ReadWriteOnce"

# pvc postgres
pvc_postgres_deploy             = false
pvc_postgres_storage_gbi        = "128Gi"
pvc_postgres_storage_class_name = ""
pvc_postgres_storage_accessmode = "ReadWriteOnce"

# pvc seaweedfs
pvc_seaweedfs_deploy             = false
pvc_seaweedfs_storage_gbi        = "128Gi"
pvc_seaweedfs_storage_class_name = ""
pvc_seaweedfs_storage_accessmode = "ReadWriteOnce"

# pvc minio
pvc_minio_deploy             = false
pvc_minio_storage_class_name = ""
pvc_minio_storage_gbi        = "128Gi"
pvc_minio_storage_accessmode = "ReadWriteOnce"
