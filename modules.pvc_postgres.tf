module "deploy-pvc-postgres" {
  source = "./persistence-claim-postgres"

  count = var.pvc_postgres_deploy ? 1 : 0

  kubernetes_tenant_namespace     = var.kubernetes_tenant_namespace
  pvc_postgres_storage_gbi        = var.pvc_postgres_storage_gbi
  pvc_postgres_storage_class_name = var.pvc_postgres_storage_class_name
  pvc_postgres_storage_accessmode = var.pvc_postgres_storage_accessmode
  pvc_postgres_disk_name          = var.pvc_postgres_disk_name
}
