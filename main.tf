locals {
  kube_config             = data.azurerm_kubernetes_cluster.current.kube_config
  tls_secret_name         = var.tls_certificate_type == "let_s_encrypt" ? "letsencrypt-prod" : "custom-tls-secret"
  use_minio_storage       = !startswith(var.cosmotech_api_version, "1.")
  use_old_redis           = (tonumber(split(".", var.cosmotech_api_version)[0]) == 3 && tonumber(split(".", var.cosmotech_api_version)[1]) >= 2) || (tonumber(split(".", var.cosmotech_api_version)[0]) > 3)
  version_redis_cosmotech = local.use_old_redis ? "1.0.12" : "1.0.8"
  host                    = local.kube_config.0.host
  client_certificate      = base64decode(local.kube_config.0.client_certificate)
  client_key              = base64decode(local.kube_config.0.client_key)
  cluster_ca_certificate  = base64decode(local.kube_config.0.cluster_ca_certificate)
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
  resource_group_name = var.common_resource_group
}

