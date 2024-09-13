output "out_rabbitmq_release_name" {
  value = helm_release.rabbitmq.metadata.0.name
}

output "out_rabbitmq_svc_name" {
  value = helm_release.rabbitmq.name
}

output "out_rabbitmq_listener_username" {
  value     = var.rabbitmq_listener_username
  sensitive = true
}

output "out_rabbitmq_listener_password" {
  value     = var.create_rabbitmq_secret ? random_password.rabbitmq_listener_password.result : data.kubernetes_secret.rabbitmq_data.0.data.listener
  sensitive = true
}

output "out_rabbitmq_sender_username" {
  value     = var.rabbitmq_sender_username
  sensitive = true
}

output "out_rabbitmq_sender_password" {
  value     = var.create_rabbitmq_secret ? random_password.rabbitmq_sender_password.result : data.kubernetes_secret.rabbitmq_data.0.data.sender
  sensitive = true
}
