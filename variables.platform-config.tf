variable "create_platform_config" {
  type = bool
}

variable "identity_authorization_url" {
  type = string
  default = ""
}

variable "identity_token_url" {
  type = string
  default = ""
}

variable "acr_login_server_url" {
  type = string
  default = ""
}