locals {
  tls_secret_name        = var.tls_certificate_type != "none" ? var.custom_tls_secret_name : var.cert_tls_secret_name
  minio_endpoint         = var.use_minio_storage ? "${module.create-minio.0.out_minio_release_name}.${var.kubernetes_tenant_namespace}.svc.cluster.local:9000" : ""
  use_minio_storage      = !startswith(var.api_version, "1.")
  kube_config            = var.kubernetes_cluster_admin_activate ? data.azurerm_kubernetes_cluster.current.kube_admin_config : data.azurerm_kubernetes_cluster.current.kube_config
  host                   = local.kube_config.0.host
  client_certificate     = base64decode(local.kube_config.0.client_certificate)
  client_key             = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
}

data "azurerm_kubernetes_cluster" "current" {
  name                = var.cluster_name
  resource_group_name = var.kubernetes_resource_group
}

resource "random_password" "redis_admin_password" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_secret_key" {
  length  = 30
  special = false
}

resource "random_password" "argo_minio_access_key" {
  length  = 30
  special = false
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
    rds_deploy       = var.rabbitmq_deploy
    adx_cluster_name = data.terraform_remote_state.tenant_infra.outputs.out_adx_cluster_name
    adx_cluster_uri  = data.terraform_remote_state.tenant_infra.outputs.out_adx_cluster_uri
    storage_name     = data.terraform_remote_state.tenant_infra.outputs.out_azure_storage_account_name

    argo_workflows_deploy  = var.argo_deploy
    argo_workflows_version = var.argo_helm_chart_version
    minio_deploy           = var.minio_deploy
    minio_version          = var.minio_version
    postgresql_deploy      = var.postgresql_deploy
    postgresql_version     = var.postgresql_version
    api_deploy             = var.deploy_api
    api_version            = var.cosmotech_api_version
    api_url                = data.terraform_remote_state.tenant_infra.outputs.out_api_cosmo_url
    redis_deploy           = var.redis_deploy
    redis_version          = var.version_redis_cosmotech

    babylon_sp_name       = data.terraform_remote_state.tenant_infra.outputs.out_babylon_sp_name
    babylon_sp_client_id  = data.terraform_remote_state.tenant_infra.outputs.out_babylon_sp_client_id
    # platform_sp_name      = "cosmotech api client"
    platform_sp_name      = data.terraform_remote_state.tenant_infra.outputs.out_platform_sp_name
    platform_sp_client_id = data.terraform_remote_state.tenant_infra.outputs.out_tenant_sp_client_id
    # platform_sp_client_id = module.create-keycloak.0.out_keycloak_api_client_id
    platform_sp_object_id = data.terraform_remote_state.tenant_infra.outputs.out_tenant_sp_object_id
    # swagger_sp_name       = "cosmotech web client"
    swagger_sp_name       = data.terraform_remote_state.tenant_infra.outputs.out_swagger_sp_name
    swagger_sp_client_id  = data.terraform_remote_state.tenant_infra.outputs.out_swagger_sp_client_id
    # swagger_sp_client_id  = module.create-keycloak.0.out_keycloak_client_id

  depends_on = [module.create-keycloak]
  }
}
