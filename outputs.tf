output "out_acr_login_server" {
  value     = module.azure-tenant-resources.out_acr_login_server
  sensitive = true
}

output "out_adx_uri" {
  value = module.azure-tenant-resources.out_adx_uri
}

output "out_cluster_adx_principal_id" {
  value = module.azure-tenant-resources.out_adx_principal_id
}

output "out_cluster_adx_name" {
  value = module.azure-tenant-resources.out_adx_name
}

output "out_cosmos_api_url" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_cosmos_api_url : "https://${var.dns_record}.${var.dns_zone_name}/cosmotech-api/${var.tenant_resource_group}"
}

output "out_cosmos_api_scope" {
  value = "https://${var.dns_record}.${var.dns_zone_name}/${var.tenant_resource_group}/.default"
}

output "out_cosmos_api_version_path" {
  value = var.api_version_path
}

output "out_tenant_resource_group_name" {
  value = var.tenant_resource_group
}

output "out_resource_location" {
  value = var.location
}

output "out_storage_account_name" {
  value = module.azure-tenant-resources.out_storage_account_name
}

output "out_storage_account_secret" {
  value     = module.azure-tenant-resources.out_storage_account_key
  sensitive = true
}

output "out_babylon_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_client_id : var.babylon_client_id
}

output "out_babylon_principal_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_principal_id : var.babylon_sp_object_id
}

output "out_babylon_client_secret" {
  value     = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_babylon_secret : var.babylon_client_secret
  sensitive = true
}

output "out_tenant_sp_client_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_client_id : var.tenant_client_id
}

output "out_tenant_sp_object_id" {
  value = var.deployment_type != "ARM" ? module.azure-tenant-prerequisites.0.out_platform_sp_object_id : var.tenant_sp_object_id
}

output "out_subscription_id" {
  value = var.subscription_id
}
