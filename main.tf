locals {
  tls_secret_name = var.tls_certificate_type != "none" ? var.custom_tls_secret_name : var.cert_tls_secret_name
  minio_endpoint  = var.minio_deploy ? "${module.create-minio.0.out_minio_release_name}.${var.kubernetes_tenant_namespace}.svc.cluster.local:9000" : ""
}

data "terraform_remote_state" "tenant_infra" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.tf_resource_group_name
    storage_account_name = var.tf_storage_account_name
    container_name       = var.tf_container_name
    key                  = var.tf_blob_name_tenant_infra
    access_key           = var.tf_access_key
  }
}

data "template_file" "summary" {
  template = file("${path.module}/summary.tpl.md")
  vars = {
    subscription_id      = data.terraform_remote_state.tenant_infra.outputs.out_azure_subscription_id
    azure_resource_group = data.terraform_remote_state.tenant_infra.outputs.out_azure_tenant_resource_group
    azure_location       = data.terraform_remote_state.tenant_infra.outputs.out_azure_resource_location

    acr_login_server = data.terraform_remote_state.tenant_infra.outputs.out_acr_login_server
    rabbitmq_deploy  = var.rabbitmq_deploy
    adx_cluster_name = data.terraform_remote_state.tenant_infra.outputs.out_adx_cluster_name
    adx_cluster_uri  = data.terraform_remote_state.tenant_infra.outputs.out_api_adx_uri
    storage_name     = data.terraform_remote_state.tenant_infra.outputs.out_azure_storage_account_name

    argo_workflows_deploy   = var.argo_deploy
    argo_workflows_version  = var.argo_helm_chart_version
    minio_deploy            = var.minio_deploy
    minio_version           = var.minio_version
    postgresql_deploy       = var.postgresql_deploy
    postgresql_version      = var.postgresql_version
    api_deploy              = var.api_deploy
    api_version             = var.api_version
    api_url                 = data.terraform_remote_state.tenant_infra.outputs.out_api_cosmo_url
    redis_deploy            = var.redis_deploy
    redis_version           = var.redis_chart_version
    seaweedfs_chart_version = var.seaweedfs_helm_chart_version

    babylon_sp_name      = data.terraform_remote_state.tenant_infra.outputs.out_babylon_sp_name
    babylon_sp_client_id = data.terraform_remote_state.tenant_infra.outputs.out_babylon_sp_client_id
    # platform_sp_name      = "cosmotech api client"
    platform_sp_name      = data.terraform_remote_state.tenant_infra.outputs.out_platform_sp_name
    platform_sp_client_id = data.terraform_remote_state.tenant_infra.outputs.out_tenant_sp_client_id
    # platform_sp_client_id = module.create-keycloak.0.out_keycloak_api_client_id
    platform_sp_object_id = data.terraform_remote_state.tenant_infra.outputs.out_tenant_sp_object_id
    # swagger_sp_name       = "cosmotech web client"
    swagger_sp_name      = data.terraform_remote_state.tenant_infra.outputs.out_swagger_sp_name
    swagger_sp_client_id = data.terraform_remote_state.tenant_infra.outputs.out_swagger_sp_client_id
    # swagger_sp_client_id  = module.create-keycloak.0.out_keycloak_client_id
  }

  depends_on = [module.create-keycloak]
}
