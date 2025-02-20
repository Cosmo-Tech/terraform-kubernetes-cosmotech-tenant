variable "minio_argo_access_key" {
  type = string
}

variable "minio_argo_secret_key" {
  type = string
}

variable "minio_requests_memory" {
  type = string
}

variable "minio_helm_repo_url" {
  type = string
}

variable "minio_helm_chart" {
  type = string
}

variable "minio_version" {
  type = string
}

variable "minio_argo_bucket_name" {
  type = string
}

variable "minio_argo_persistence_size" {
  type = string
}

variable "minio_argo_requests_memory" {
  type = string
}

variable "use_minio_storage" {
  type = bool
}

variable "minio_deploy" {
  type = bool
}

variable "minio_existing_pvc_name" {
  type = string
}