variable "argo_minio_persistence_size" {
  type = string
}

variable "argo_minio_requests_memory" {
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

variable "argo_minio_secret_key" {
  type = string
}

variable "argo_minio_access_key" {
  type = string
}

variable "minio_deploy" {
  type = bool
}
