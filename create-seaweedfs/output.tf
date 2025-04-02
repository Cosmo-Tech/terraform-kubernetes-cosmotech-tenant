output "out_s3_endpoint" {
  value = "${helm_release.seaweedfs.name}-s3.${var.namespace}.svc.cluster.local:8333"
}

output "out_s3_credentials_secret" {
  value = "${local.release_name}-s3-auth"
}
