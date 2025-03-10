variable "pvc_redis_storage_gbi" {
  type = string
}
variable "pvc_redis_replicas" {
  type = number
}
variable "pvc_redis_storage_class_name" {
  type = string
}
variable "pvc_redis_deploy" {
  type = bool
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