output "out_host_svc_redis" {
  value = "${helm_release.cosmotechredis.name}-master"
}