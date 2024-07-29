variable "rabbitmq_helm_release_name" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmq_listener_username" {
  type    = string
  default = "cosmotech_api_listener"
}

variable "rabbitmq_sender_username" {
  type    = string
  default = "cosmotech_run_sender"
}