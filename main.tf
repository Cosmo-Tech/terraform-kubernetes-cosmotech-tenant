locals {
  tls_secret_name        = var.tls_certificate_type != "none" ? var.custom_tls_secret_name : var.cert_tls_secret_name
  minio_endpoint         = var.use_minio_storage ? "${module.create-minio.0.out_minio_release_name}.${var.kubernetes_tenant_namespace}.svc.cluster.local:9000" : ""
  use_minio_storage      = !startswith(var.api_version, "1.")
  kube_config            = data.azurerm_kubernetes_cluster.current.kube_config
  host                   = local.kube_config.0.host
  client_certificate     = base64decode(local.kube_config.0.client_certificate)
  client_key             = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "main_namespace" {
  metadata {
    name = var.kubernetes_tenant_namespace
    labels = {
      "pod-security.kubernetes.io/enforce"         = "restricted"
      "pod-security.kubernetes.io/enforce-version" = "latest"
    }
  }
}

provider "kubernetes" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.host
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

provider "kubectl" {
  host                   = local.host
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate

  load_config_file = false
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

data "template_file" "summary" {
  template = file("${path.module}/summary.tpl.md")
  vars = {
    acr_login_server = var.acr_login_server
    rds_deploy       = var.rabbitmq_deploy

    argo_workflows_deploy   = var.argo_deploy
    argo_workflows_version  = var.argo_version
    minio_deploy            = var.use_minio_storage
    minio_version           = var.minio_version
    rabbitmq_deploy         = var.rabbitmq_deploy
    postgresql_deploy       = var.postgresql_deploy
    postgresql_version      = var.postgresql_version
    api_deploy              = var.api_deploy
    api_version             = var.api_chart_package_version
    api_url                 = "<https://${var.api_dns_name}/cosmotech-api/${var.kubernetes_tenant_namespace}/${var.api_version_path}/>"
    redis_deploy            = var.redis_deploy
    redis_version           = var.redis_chart_version
    seaweedfs_chart_version = var.seaweedfs_chart_version

    platform_sp_name      = "cosmotech api client"
    platform_sp_client_id = module.create-keycloak.0.out_keycloak_api_client_id
    swagger_sp_name       = "cosmotech web client"
    swagger_sp_client_id  = module.create-keycloak.0.out_keycloak_client_id

  }

  depends_on = [module.create-keycloak]
}
