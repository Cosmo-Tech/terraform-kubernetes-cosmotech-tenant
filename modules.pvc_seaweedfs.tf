module "deploy-pvc-seaweedfs" {
  source = "./persistence-claim-seaweedfs"

  count = var.pvc_seaweedfs_deploy ? 1 : 0

  kubernetes_tenant_namespace      = var.kubernetes_tenant_namespace
  pvc_seaweedfs_storage_gbi        = var.pvc_seaweedfs_storage_gbi
  pvc_seaweedfs_storage_class_name = var.pvc_seaweedfs_storage_class_name
  pvc_seaweedfs_storage_accessmode = var.pvc_seaweedfs_storage_accessmode

}