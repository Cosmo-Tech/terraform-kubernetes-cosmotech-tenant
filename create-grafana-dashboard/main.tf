terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.22.0"
    }
  }
}

locals {
  redis_datasource_name = "datasource_${var.redis_host_namespace}"
  redis_url = "redis://cosmotechredis-${var.redis_host_namespace}-master.${var.redis_host_namespace}.svc.cluster.local:${var.redis_port}"
}

resource "grafana_data_source" "redis-datasource" {
  name = local.redis_datasource_name
  type = "redis-datasource"

  url  = local.redis_url
  basic_auth_enabled = true
  basic_auth_username = var.redis_auth_user

  secure_json_data_encoded = jsonencode({
    password = var.redis_auth_password
  })
}

resource "grafana_folder" "folder" {
  title = "Tenant ${var.redis_host_namespace}"
}

resource "grafana_dashboard" "redis_dashboard" {
  folder = grafana_folder.folder.id
  config_json = templatefile("${path.module}/dashboard/redis_dashboard.json", {"title" = "Redis_${var.redis_host_namespace}", "DATASOURCE_ID" = split(":", grafana_data_source.redis-datasource.id)[1]})
}

resource "grafana_dashboard" "licensing_dashboard" {
  folder = grafana_folder.folder.id
  config_json = templatefile("${path.module}/dashboard/cosmotech_licencing_dashboard.json", {"title" = "Cosmotech_licencing_${var.redis_host_namespace}", "DATASOURCE_ID" = split(":", grafana_data_source.redis-datasource.id)[1]})
}

resource "grafana_dashboard" "filtered_licensing_dashboard" {
  folder = grafana_folder.folder.id
  config_json = templatefile("${path.module}/dashboard/cosmotech_filtered_licencing_dashboard.json", {"title" = "Cosmotech_licencing_with_filter_${var.redis_host_namespace}", "DATASOURCE_ID" = split(":", grafana_data_source.redis-datasource.id)[1]})
}

output "datasource_id" {
  description = "datasource's generated id by grafana"
  value = grafana_data_source.redis-datasource.id
}
