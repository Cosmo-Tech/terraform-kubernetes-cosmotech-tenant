module "platform-tenant-resources" {
  source = "./platform-tenant-resources"

  api_dns_name                       = var.api_dns_name
  api_replicas                       = var.api_replicas
  tenant_id                          = var.tenant_id
  client_id                          = var.client_id
  client_secret                      = var.client_secret
  location                           = var.location
  tls_secret_name                    = local.tls_secret_name
  tls_certificate_type               = var.tls_certificate_type
  tls_certificate_custom_certificate = var.tls_certificate_custom_certificate
  tls_certificate_custom_key         = var.tls_certificate_custom_key
  kubernetes_tenant_namespace        = var.kubernetes_tenant_namespace
  monitoring_enabled                 = var.monitoring_enabled == "true" ? true : false
  monitoring_namespace               = var.monitoring_namespace
  chart_package_version              = var.chart_package_version
  tenant_resource_group              = var.tenant_resource_group
  redis_disk_name                    = var.redis_disk_name
  redis_disk_sku                     = var.redis_disk_sku
  redis_port                         = var.redis_port
  argo_minio_persistence_size        = var.argo_minio_persistence_size
  argo_minio_requests_memory         = var.argo_minio_requests_memory
  archive_ttl                        = var.archive_ttl
  cluster_issuer_name                = var.cluster_issuer_name
  cosmotech_api_version              = var.cosmotech_api_version
  cosmotech_api_version_path         = var.api_version_path
  cosmotech_api_ingress_enabled      = var.cosmotech_api_ingress_enabled
  tenant_client_id                   = var.tenant_client_id
  tenant_client_secret               = var.tenant_client_secret
  storage_account_key                = var.storage_account_key
  storage_account_name               = var.storage_account_name
  create_rabbitmq                    = var.create_rabbitmq
}
