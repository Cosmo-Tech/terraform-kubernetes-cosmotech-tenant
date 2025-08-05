# Provider configuration for tests
provider "keycloak" {
  url = "http://localhost:8080"
  username = "admin"
  password = "admin"
  initial_login = true
  client_id = "admin-cli"
  realm = "master"
  tls_insecure_skip_verify = true
}

# Common variables for both tests
variables {
  kubernetes_tenant_namespace = "test-namespace"
  api_dns_name = "test.api.cosmotech.com"
  keycloak_realm_jwt_claim_api_client = "test_api_client"
  keycloak_realm_jwt_claim_web_client = "test_web_client"
  keycloak_add_identity_provider_azure = false
  keycloak_user_app_role = ["test-user"]
  tenant_id = "test-tenant"
  api_version_path = "v4"
}

run "by_default_do_not_create_automation_client" {
  command = plan
  variables {
    # automation client is not deployed
  }
  assert {
    condition = keycloak_realm.realm.realm == var.kubernetes_tenant_namespace
    error_message = "Keycloak realm should be created"
  }
  assert {
    condition = length(keycloak_openid_client.automation-client) == 0
    error_message = "Keycloak automation client should not be created"
  }
}

run "verify_automation_client_creation" {
  command = plan
  variables {
  deploy_automation_client = true
  }
  assert {
    condition = keycloak_realm.realm.realm == var.kubernetes_tenant_namespace
    error_message = "Keycloak realm should be created"
  }
  assert {
    condition = keycloak_openid_client.automation-client[0].client_id == "automation-client"
    error_message = "Keycloak automation client should be created"
  }
}
