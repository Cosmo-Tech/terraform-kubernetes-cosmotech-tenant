output "out_s3_endpoint" {
  value = "${helm_release.seaweedfs.name}-s3.${var.namespace}.svc.cluster.local:8333"
}

output "out_s3_credentials_secret" {
  value = "${local.release_name}-s3-auth"
}

output "out_s3_credentials_keys" {
  value = {
    "argo_workflows_username" = "argo-workflows-username"
    "argo_workflows_password" = "argo-workflows-password"
    "grafana_loki_username"   = "grafana-loki-username"
    "grafana_loki_password"   = "grafana-loki-password"
  }
}
