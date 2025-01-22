# Outputs to be consumed by Cosmo Tech API
output "out_keycloak_client_id" {
  value = keycloak_openid_client.cosmotech-web-client.id
}
output "out_keycloak_client_secret" {
  value     = keycloak_openid_client.cosmotech-web-client.client_secret
  sensitive = true
}
output "keycloak_user" {
  value = keycloak_user.user_with_initial_password.username
}
output "out_keycloak_api_client_id" {
  value = keycloak_openid_client.cosmotech-api-client.id
}
output "out_keycloak_api_client_secret" {
  value = keycloak_openid_client.cosmotech-api-client.client_secret
}