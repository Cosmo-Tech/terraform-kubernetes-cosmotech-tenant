variable "create_rabbitmq" {
  description = "Whether to create RabbitMQ resources"
  type        = bool
  default     = true
}

variable "rabbitmq_helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "rabbitmq_helm_chart" {
  type    = string
  default = "rabbitmq"
}

variable "rabbitmq_helm_chart_version" {
  type    = string
  default = "13.0.3"
}

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

variable "rabbitmq_persistence_size" {
  type    = string
  default = "8Gi"
}