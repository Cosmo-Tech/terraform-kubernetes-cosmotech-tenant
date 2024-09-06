output "out_host_svc_redis" {
  value = "${helm_release.cosmotechredis.name}-master"
}

output "out_redis_admin_password" {
  value = data.kubernetes_secret.redis_secret.data.password
}