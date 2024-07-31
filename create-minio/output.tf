output "out_minio_release_name" {
  value = helm_release.minio.metadata.0.name
}

output "out_minio_svc_name" {
  value = helm_release.minio.name
}