resource "keycloak_realm" "realm" {
    realm = var.realm_name
}

resource "random_password" "api_client_secret_key" {
    length  = 30
    special = false
}

resource "keycloak_openid_client" "cosmotech_api_client" {
    realm_id        = keycloak_realm.realm.id
    client_id       = "cosmotech_api_client"

    name            = "cosmotech api client"

    access_type     = "CONFIDENTIAL"
    client_secret   = random_password.api_client_secret_key.result

    service_accounts_enabled = true
 
    depends_on = [keycloak_realm.realm]
}

resource "random_password" "web_client_secret_key" {
    length  = 30
    special = false
}

resource "keycloak_openid_client" "cosmotech_web_client" {
    realm_id        = keycloak_realm.realm.id
    client_id       = "cosmotech_web_client"

    name            = "cosmotech web client"

    access_type     = "CONFIDENTIAL"
    client_secret   = random_password.web_client_secret_key.result

    root_url = var.client_root_url
    valid_redirect_uris = var.valid_redirect_uri
    valid_post_logout_redirect_uris = ["+"]
    web_origins = ["+"]
    admin_url = "" # required due to keycloakAPI limitation

    standard_flow_enabled = true
 
    depends_on = [keycloak_realm.realm]
}


resource "keycloak_role" "realm_role_admin" {
    realm_id    = keycloak_realm.realm.id
    name        = "Platform.Admin"

    depends_on = [keycloak_realm.realm]
}

resource "keycloak_role" "realm_role_user" {
    realm_id    = keycloak_realm.realm.id
    name        = "Organization.User"

    depends_on = [keycloak_realm.realm]
}
