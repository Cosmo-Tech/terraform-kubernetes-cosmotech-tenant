variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "helm_chart_version" {
  type    = string
}

variable "helm_release_name" {
  type    = string
}

variable "rabbitmq_listener_username" {
  type    = string
}

variable "rabbitmq_sender_username" {
  type    = string
}

variable "persistence_size" {
  type = string
}