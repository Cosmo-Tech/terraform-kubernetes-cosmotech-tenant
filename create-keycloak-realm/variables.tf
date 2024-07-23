variable "keycloak_admin_user" {
    type = string
}

variable "keycloak_admin_password" {
    type = string
}

variable "keycloak_url" {
    type = string
}

variable "realm_name" {
    type = string
}

variable "client_root_url" {
    type = string
}

variable "valid_redirect_uri" {
    type = list(string)
}
