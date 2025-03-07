module "create-minio" {
  source = "./create-minio"

  count = var.minio_deploy ? 1 : 0

  namespace                   = var.kubernetes_tenant_namespace
  monitoring_namespace        = var.monitoring_namespace
  argo_minio_access_key       = var.minio_argo_access_key
  argo_minio_secret_key       = var.minio_argo_secret_key
  argo_minio_persistence_size = var.minio_argo_persistence_size
  argo_minio_requests_memory  = var.minio_argo_requests_memory
  argo_bucket_name            = var.minio_argo_bucket_name
  helm_chart                  = var.minio_helm_chart
  helm_repo_url               = var.minio_helm_repo_url
  minio_version               = var.minio_version
  minio_existing_pvc_name     = var.minio_existing_pvc_name
  minio_storage_class_name    = var.pvc_minio_storage_class_name
}