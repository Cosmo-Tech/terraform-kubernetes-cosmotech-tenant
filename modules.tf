module "azure-tenant-prerequisites" {
  source = "./azure-tenant-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  tenant_id                      = var.tenant_id
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  platform_url                   = var.platform_url
  identifier_uri                 = var.identifier_uri
  project_stage                  = var.project_stage
  project_name                   = var.project_name
  owner_list                     = var.owner_list
  audience                       = var.audience
  webapp_url                     = var.webapp_url
  location                       = var.location
  tenant_resource_group          = var.tenant_resource_group
  common_resource_group          = var.common_resource_group
  dns_record                     = var.dns_record
  dns_zone_name                  = var.dns_zone_name
  dns_zone_rg                    = var.dns_zone_rg
  virtual_network_address_prefix = var.tenant_virtual_network_address_prefix
  api_version_path               = var.api_version_path
  customer_name                  = var.customer_name
  user_app_role                  = var.user_app_role
  image_path                     = var.image_path
  chart_package_version          = var.chart_package_version
  create_restish                 = var.create_restish
  create_powerbi                 = var.create_powerbi
  create_secrets                 = var.create_secrets
  create_webapp                  = var.create_webapp
  create_babylon                 = var.create_babylon
  cost_center                    = var.cost_center
  kubernetes_tenant_namespace    = var.kubernetes_tenant_namespace
}

module "azure-tenant-resources" {
  source = "./azure-tenant-resources"

  deployment_type                              = var.deployment_type
  subscription_id                              = var.subscription_id
  location                                     = var.location
  tenant_virtual_network_address_prefix        = var.tenant_virtual_network_address_prefix
  tenant_virtual_subnet_network_address_prefix = var.tenant_virtual_subnet_network_address_prefix
  managed_disk_name                            = var.managed_disk_name
  cluster_name                                 = var.cluster_name
  project_stage                                = var.project_stage
  project_name                                 = var.project_name
  customer_name                                = var.customer_name
  cost_center                                  = var.cost_center
  network_sp_object_id                         = var.network_sp_object_id
  storage_kind                                 = var.storage_kind
  vnet_resource_group                          = var.vnet_resource_group
  create_backup                                = var.create_backup
  create_cosmosdb                              = var.create_cosmosdb
  create_adx                                   = var.create_adx
  create_eventhub                              = var.create_eventhub

  blob_privatedns_zonename     = var.blob_privatedns_zonename
  queue_privatedns_zonename    = var.queue_privatedns_zonename
  table_privatedns_zonename    = var.table_privatedns_zonename
  eventhub_privatedns_zonename = var.eventhub_privatedns_zonename
  adt_privatedns_zonename      = var.adt_privatedns_zonename

  redis_disk_tier           = var.redis_disk_tier
  redis_disk_sku            = var.redis_disk_sku
  redis_disk_size_gb        = var.redis_disk_size_gb
  kusto_instance_type       = var.kusto_instance_type
  kustonr_instances         = var.kustonr_instances
  auto_stop_kusto           = var.auto_stop_kusto
  storage_tier              = split("_", var.kubernetes_azurefile_storage_class_sku)[0]
  storage_replication_type  = split("_", var.kubernetes_azurefile_storage_class_sku)[1]
  tenant_group_id           = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_tenant_group_id : var.tenant_group_id
  tenant_sp_object_id       = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.tenant_sp_object_id
  tenant_resource_group     = var.deployment_type != "ARM" ? azurerm_resource_group.tenant_rg.0 : data.azurerm_resource_group.tenant_rg.0
  common_platform_object_id = var.common_platform_object_id

  public_ip_id          = data.azurerm_public_ip.current.id
  common_resource_group = data.azurerm_resource_group.current
  vnet                  = data.azurerm_virtual_network.current

  tags = {
    vendor      = "cosmotech"
    stage       = var.project_stage
    customer    = var.customer_name
    project     = var.project_name
    cost_center = var.cost_center
    customertag = var.kubernetes_azurefile_storage_tags
  }

  depends_on = [module.azure-tenant-prerequisites]
}

module "create-vault-entries" {
  source = "./create-vault-entries"

  count = var.create_vault_entries ? 1 : 0

  tenant_id                   = var.tenant_id
  kubernetes_tenant_namespace = var.kubernetes_tenant_namespace
  platform_name               = var.platform_name
  organization_name           = var.organization_name
  vault_addr                  = var.vault_addr
  vault_token                 = var.vault_token
  storage_account_name        = var.tf_storage_account_name
  storage_account_key         = var.tf_access_key
  storage_container           = var.tf_container_name
  tfstate_blob_name           = var.tf_blob_name_tenant

  depends_on = [module.platform-tenant-resources]
}

module "platform-tenant-resources" {
  source = "./platform-tenant-resources"

  api_dns_name                       = var.api_dns_name
  api_replicas                       = var.api_replicas
  subscription_id                    = var.subscription_id
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
  network_client_id                  = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_network_adt_clientid : var.network_client_id
  network_client_secret              = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_network_adt_password : var.network_client_secret
  tenant_client_id                   = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_id : var.tenant_client_id
  tenant_client_secret               = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_secret : var.tenant_client_secret
  managed_disk_id                    = module.azure-tenant-resources.out_managed_disk_id
  storage_account_key                = module.azure-tenant-resources.out_storage_account_key
  storage_account_name               = module.azure-tenant-resources.out_storage_account_name
  acr_login_password                 = module.azure-tenant-resources.out_acr_login_password
  acr_login_server                   = module.azure-tenant-resources.out_acr_login_server
  acr_login_username                 = module.azure-tenant-resources.out_acr_login_username
  adx_ingestion_uri                  = module.azure-tenant-resources.out_adx_ingestion_uri
  adx_uri                            = module.azure-tenant-resources.out_adx_uri
  cosmos_uri                         = module.azure-tenant-resources.out_cosmos_uri
  cosmos_key                         = module.azure-tenant-resources.out_cosmos_key
  eventbus_uri                       = module.azure-tenant-resources.out_eventbus_uri
  kube_config                        = data.azurerm_kubernetes_cluster.current.kube_config
  identifier_uri                     = var.identifier_uri
  create_rabbitmq                    = var.create_rabbitmq
  list_apikey_allowed                = var.list_apikey_allowed

  depends_on = [module.azure-tenant-resources]
}
