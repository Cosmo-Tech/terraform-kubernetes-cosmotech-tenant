module "create-argo" {
  source = "./create-argo"

  count = var.argo_deploy ? 1 : 0

  namespace                   = var.kubernetes_tenant_namespace
  postgres_argo_user          = module.create-postgresql-db.0.out_argo_postgresql_user
  postgres_release_name       = module.create-postgresql-db.0.out_postgres_release_name
  s3_bucket_name              = var.argo_s3_bucket_name
  s3_endpoint                 = var.minio_deploy ? local.minio_endpoint : module.create-seaweedfs.0.out_s3_endpoint
  s3_credentials_secret       = var.minio_deploy ? module.create-minio.0.out_minio_release_name : module.create-seaweedfs.0.out_s3_credentials_secret
  s3_username_key             = var.minio_deploy ? "root-user" : "argo-workflows-username"
  s3_password_key             = var.minio_deploy ? "root-password" : "argo-workflows-password"
  argo_database               = var.argo_database
  argo_postgresql_secret_name = var.argo_postgresql_secret_name
  helm_chart                  = var.argo_helm_chart
  helm_repo_url               = var.argo_helm_repo_url
  helm_chart_version          = var.argo_helm_chart_version

  depends_on = [
    module.create-postgresql-db,
    module.create-seaweedfs,
    module.create-minio
  ]
}
