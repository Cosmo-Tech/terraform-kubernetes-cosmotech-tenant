provider "keycloak" {
    client_id     = "admin-cli"
    username      = var.keycloak_admin_user
    password      = var.keycloak_admin_password
    url           = var.keycloak_url
}
