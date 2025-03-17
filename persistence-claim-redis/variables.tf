variable "kubernetes_tenant_namespace" {
  type = string
}

variable "pvc_redis_storage_gbi" {
  type = string
}

variable "pvc_redis_storage_class_name" {
  type = string
}

variable "pvc_redis_storage_accessmode" {
  type = string
}
variable "pvc_redis_disk_master_name" {
  type = string
}
variable "pvc_redis_disk_replica_name" {
  type = string
}