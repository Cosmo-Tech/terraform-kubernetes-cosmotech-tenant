output "out_rabbitmq_release_name" {
  value = helm_release.rabbitmq.metadata.0.name
}

output "out_rabbitmq_listener_username" {
  value     = var.rabbitmq_listener_username
  sensitive = true
}

output "out_rabbitmq_listener_password" {
  value     = random_password.rabbitmq_listener_password.result
  sensitive = true
}

output "out_rabbitmq_sender_username" {
  value     = var.rabbitmq_sender_username
  sensitive = true
}

output "out_rabbitmq_sender_password" {
  value     = random_password.rabbitmq_sender_password.result
  sensitive = true
}
