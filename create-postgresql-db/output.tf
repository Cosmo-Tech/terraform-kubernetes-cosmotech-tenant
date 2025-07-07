output "out_postgres_release_name" {
  value = helm_release.postgresql.metadata.0.name
}

output "out_postgres_svc_name" {
  value = helm_release.postgresql.name
}

output "out_postgres_reader_username" {
  value     = var.cosmotech_api_reader_username
  sensitive = true
}

output "out_postgres_reader_password" {
  value     = data.kubernetes_secret.postgres_config.data.cosmotech-api-reader-password
  sensitive = true
}

output "out_postgres_writer_username" {
  value     = var.cosmotech_api_writer_username
  sensitive = true
}

output "out_postgres_writer_password" {
  value     = data.kubernetes_secret.postgres_config.data.cosmotech-api-writer-password
  sensitive = true
}

output "out_postgres_admin_username" {
  value     = var.cosmotech_api_admin_username
  sensitive = true
}

output "out_postgres_admin_password" {
  value     = data.kubernetes_secret.postgres_config.data.cosmotech-api-admin-password
  sensitive = true
}

output "out_postgres_seawweedfs_database" {
  value     = local.seaweedfs_database
  sensitive = true
}

output "out_postgres_seawweedfs_username" {
  value     = local.seaweedfs_username
  sensitive = true
}

output "out_postgres_seawweedfs_password_secret" {
  value     = local.seaweedfs_password_secret
  sensitive = true
}

output "out_argo_postgresql_user" {
  value = var.argo_postgresql_user
}