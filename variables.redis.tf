variable "redis_admin_password" {
  type = string
}
variable "redis_helm_repo_url" {
  type = string
}
variable "redis_helm_release_name" {
  type = string
}
variable "redis_helm_chart_name" {
  type = string
}
variable "redis_chart_version" {
  type = string
}
variable "redis_cosmotech_version" {
  type = string
}
variable "redis_persistence_size" {
  type = string
}
variable "redis_deploy" {
  type = bool
}
variable "redis_port" {
  type = number
}
variable "redis_master_existing_pvc_name" {
  type = string
}
variable "redis_replica_existing_pvc_name" {
  type = string
}
variable "redis_pvc_storage_class_name" {
  type = string
}
variable "first_tenant_in_cluster" {
  type = bool
}
variable "redis_resources" {
  type = object({
    limits = object({
      cpu    = string
      memory = string
    })
    requests = object({
      cpu    = string
      memory = string
    })
  })
}
