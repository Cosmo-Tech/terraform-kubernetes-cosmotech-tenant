variable "rabbitmq_namespace" {
  type = string
}
variable "rabbitmq_helm_repo_url" {
  type = string
}
variable "rabbitmq_helm_chart" {
  type = string
}
variable "rabbitmq_helm_chart_version" {
  type = string
}
variable "rabbitmq_helm_release_name" {
  type = string
}
variable "rabbitmq_listener_username" {
  type = string
}
variable "rabbitmq_sender_username" {
  type = string
}
variable "rabbitmq_persistence_size" {
  type = string
}
variable "rabbitmq_deploy" {
  type = bool
}
variable "create_rabbitmq_secret" {
  type = bool
}
