variable "kubernetes_tenant_namespace" {
  type = string
}
variable "pvc_redis_storage_gbi" {
  type = string
}
variable "pvc_redis_replicas" {
  type = number
}
variable "pvc_redis_storage_class_name" {
  type = string
}