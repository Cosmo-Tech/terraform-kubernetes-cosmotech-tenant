terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
}

resource "keycloak_realm" "realm" {
  realm   = var.kubernetes_tenant_namespace
  enabled = true
}

# create web client
resource "keycloak_openid_client" "cosmotech-web-client" {
  realm_id  = keycloak_realm.realm.id
  client_id = "cosmotech-web-client"

  name    = "cosmotech-web-client"
  enabled = true

  standard_flow_enabled = true
  access_type           = "CONFIDENTIAL"
  valid_redirect_uris = [
    "https://${var.api_dns_name}/cosmotech-api/${var.kubernetes_tenant_namespace}/v4/swagger-ui/oauth2-redirect.html",
    "/cosmotech-api/*",
    "/cosmotech-api*"
  ]

  login_theme = "keycloak"

  # Added parameters
  root_url           = "https://${var.api_dns_name}"
  base_url           = "/cosmotech-api/${var.kubernetes_tenant_namespace}/v4/"
  web_origins        = ["+"]
  full_scope_allowed = true
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_realm.realm.id
  client_id = keycloak_openid_client.cosmotech-web-client.id

  default_scopes = [
    "web-origins",
    "acr",
    "roles",
    "profile",
    "basic",
    "email"
  ]
}

resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = keycloak_realm.realm.id
  client_id = keycloak_openid_client.cosmotech-web-client.id

  optional_scopes = [
    "address",
    "phone",
    "offline_access",
    "microprofile-jwt",
  ]
}

# create roles
resource "keycloak_role" "platform_admin_role" {
  realm_id = keycloak_realm.realm.id
  name     = "Platform.Admin"
}

resource "keycloak_role" "organization_user_role" {
  realm_id = keycloak_realm.realm.id
  name     = "Organization.User"
}

# create auto linker
resource "keycloak_authentication_flow" "flow" {
  realm_id    = keycloak_realm.realm.id
  alias       = "auto link user"
  provider_id = "basic-flow"
}

resource "keycloak_authentication_execution" "execution1" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.flow.alias
  authenticator     = "idp-create-user-if-unique"
  requirement       = "ALTERNATIVE"
}

resource "keycloak_authentication_execution" "execution2" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.flow.alias
  authenticator     = "idp-auto-link"
  requirement       = "ALTERNATIVE"

  depends_on = [keycloak_authentication_execution.execution1]
}

# create user
resource "keycloak_user" "user_with_initial_password" {
  realm_id = keycloak_realm.realm.id
  username = "default-tenant-user"
  enabled  = true
}