# api
api_deploy            = true
api_helm_chart        = "cosmotech-api-chart"
api_helm_repository   = "oci://ghcr.io/cosmo-tech"
api_helm_release_name = "cosmotech-api"
api_is_multitenant    = true
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

# redis
redis_deploy            = true
redis_admin_password    = ""
redis_helm_repo_url     = "https://charts.bitnami.com/bitnami"
redis_helm_release_name = "cosmotechredis"
redis_helm_chart_name   = "redis"
redis_chart_version     = ""
redis_pv_capacity       = ""
redis_cosmotech_version = "1.0.12"
redis_persistence_size  = "64Gi"

# seaweedfs
seaweedfs_chart_version = "3.0.4"

# tenant
tenant_client_id     = ""
tenant_client_secret = ""

#Modeling API Deployment
deployment_helm_chart                   = "api-deployment"
deployment_helm_repository              = "https://cosmo-tech.github.io/tekton/"
deployment_chart_package_version        = "0.1.13"
deployment_helm_release_name            = "modeling-api-deployment"
modeling_api_monitoring_enabled         = false
modeling_api_monitoring_namespace       = "cosmotech-monitoring"
modeling_api_persistence_storage_class  = ""
modeling_api_docker_secret              = "" 
modeling_api_webhook_secret             = ""
ingress_type               = ""
ngrok_host                 = ""


#Cosmotech API Deployment
api_deployment_helm_chart                   = "api-deployment"
api_deployment_helm_repository              = "https://cosmo-tech.github.io/tekton/"
api_deployment_chart_package_version        = "0.1.13"
api_deployment_helm_release_name            = "cosmotech-api-deployment"
api_docker_secret                           = "" 
api_webhook_secret                          = ""
api_ingress_type                            = ""
api_ngrok_host                              = ""

