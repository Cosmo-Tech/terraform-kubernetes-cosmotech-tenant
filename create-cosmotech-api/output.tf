output "out_cosmotech_api_release_name" {
  value = helm_release.cosmotech-api.metadata.0.name
}