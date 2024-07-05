output "out_minio_release_name" {
  value = helm_release.minio.metadata.0.name
}
