locals {
  kube_config_admin      = data.azurerm_kubernetes_cluster.current.kube_admin_config
  kube_config_user       = data.azurerm_kubernetes_cluster.current.kube_config
  kube_config            = var.kubernetes_cluster_admin_activate ? local.kube_config_admin : local.kube_config_user
}

data "azurerm_kubernetes_cluster" "current" {
  name                = var.cluster_name
  resource_group_name = var.kubernetes_resource_group
}
