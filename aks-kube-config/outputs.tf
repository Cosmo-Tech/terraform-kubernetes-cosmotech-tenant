output "kubernetes_config_user" {
  value = data.azurerm_kubernetes_cluster.current.kube_config
}

output "kubernetes_config_admin" {
  value = data.azurerm_kubernetes_cluster.current.kube_admin_config
}

output "kubernetes_config_host" {
  value = local.kube_config.0.host
}

output "kubernetes_config_client_certificate" {
  value = base64decode(local.kube_config.0.client_certificate)
}

output "kubernetes_config_client_key" {
  value = base64decode(local.kube_config.0.client_key)
}

output "kubernetes_config_cluster_ca_certificate" {
  value = base64decode(local.kube_config.0.cluster_ca_certificate)
}
