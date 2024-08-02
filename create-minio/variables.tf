variable "namespace" {
  type = string
}

variable "monitoring_namespace" {
  type = string
}

variable "argo_minio_access_key" {
  type = string
}

variable "argo_minio_secret_key" {
  type = string
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "minio_version" {
  type    = string
}

variable "argo_bucket_name" {
  type    = string
}

variable "argo_minio_persistence_size" {
  type    = string
}

variable "argo_minio_requests_memory" {
  type    = string
}