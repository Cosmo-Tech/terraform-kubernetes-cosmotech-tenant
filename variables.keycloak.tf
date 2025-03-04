variable "keycloak_deploy" {
  type        = bool
  description = <<EOT
Wether to create Keycloak resources fot this tenant :
- realm
- OpenID client & scopes
- roles
- Authentication flow
- Default user
After this deployment, you will need to manually set the authentication flow
 as the default to the broker identification. To do so go to the Authentication menu.
 On the new line with the "auto link user" flow, click the 3 dot at the end of the line
  and then "Bind flow". Then select **First broker login flow**.
 You should have the newly created flow "auto link user" with the column Used by set to
  First broker login flow.
EOT
}

variable "keycloak_client_id" {
  type = string
}

variable "keycloak_client_secret" {
  type = string
}

variable "keycloak_username" {
  type = string
}

variable "keycloak_password" {
  type = string
}

variable "keycloak_url" {
  type = string
}
variable "keycloak_realm_jwt_claim_api_client" {
  type = string
}
variable "keycloak_realm_jwt_claim_web_client" {
  type = string
}

variable "keycloak_user_app_role" {
  type = list(string)
}

variable "keycloak_add_identity_provider_azure" {
  type = bool
}