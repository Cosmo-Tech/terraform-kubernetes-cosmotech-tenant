module "create-keycloak" {
  source = "./create-keycloak-realm"

  count = var.keycloak_deploy ? 1 : 0

  kubernetes_tenant_namespace          = var.kubernetes_tenant_namespace
  api_dns_name                         = var.api_dns_name
  keycloak_realm_jwt_claim_api_client  = var.keycloak_realm_jwt_claim_api_client
  keycloak_realm_jwt_claim_web_client  = var.keycloak_realm_jwt_claim_web_client
  keycloak_add_identity_provider_azure = var.keycloak_add_identity_provider_azure
  keycloak_user_app_role               = var.keycloak_user_app_role
  tenant_id                            = var.tenant_id
  api_version_path                     = var.api_version_path

  depends_on = [module.create-argo]
}