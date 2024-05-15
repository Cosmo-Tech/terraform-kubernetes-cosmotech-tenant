output "out_postgres_release_name" {
  value = helm_release.postgresql.metadata.0.name
}

output "out_postgres_reader_username" {
  value     = var.cosmotech_api_reader_username
  sensitive = true
}

output "out_postgres_reader_password" {
  value     = random_password.postgresql_reader_password.result
  sensitive = true
}

output "out_postgres_writer_username" {
  value     = var.cosmotech_api_writer_username
  sensitive = true
}

output "out_postgres_writer_password" {
  value     = random_password.postgresql_writer_password.result
  sensitive = true
}

output "out_postgres_admin_username" {
  value     = var.cosmotech_api_admin_username
  sensitive = true
}

output "out_postgres_admin_password" {
  value     = random_password.postgresql_admin_password.result
  sensitive = true
}
