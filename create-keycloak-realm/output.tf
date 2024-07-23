output "out_api_client_id" {
    value = keycloak_openid_client.cosmotech_api_client.metadata.0.client_id
}

output "out_api_client_secret" {
    value = keycloak_openid_client.cosmotech_api_client.metadata.0.client_secret
}
