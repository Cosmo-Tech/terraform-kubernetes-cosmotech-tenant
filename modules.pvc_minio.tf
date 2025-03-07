module "deploy-pvc-minio" {
  source = "./persistence-claim-minio"

  count = var.pvc_minio_deploy ? 1 : 0

  kubernetes_tenant_namespace  = var.kubernetes_tenant_namespace
  pvc_minio_storage_gbi        = var.pvc_minio_storage_gbi
  pvc_minio_storage_class_name = var.pvc_minio_storage_class_name
  pvc_minio_storage_accessmode = var.pvc_minio_storage_accessmode

}