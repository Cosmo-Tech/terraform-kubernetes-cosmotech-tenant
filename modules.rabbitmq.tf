module "create-rabbitmq" {
  source = "./create-rabbitmq"

  count = var.rabbitmq_deploy ? 1 : 0

  namespace                  = var.kubernetes_tenant_namespace
  monitoring_namespace       = var.monitoring_namespace
  persistence_size           = var.rabbitmq_persistence_size
  helm_chart                 = var.rabbitmq_helm_chart
  helm_chart_version         = var.rabbitmq_helm_chart_version
  helm_release_name          = var.rabbitmq_helm_release_name
  helm_repo_url              = var.rabbitmq_helm_repo_url
  rabbitmq_listener_username = var.rabbitmq_listener_username
  rabbitmq_sender_username   = var.rabbitmq_sender_username
  create_rabbitmq_secret     = var.create_rabbitmq_secret
}