variable "argo_minio_persistence_size" {
  type    = string
  default = "16Gi"
}

variable "argo_minio_requests_memory" {
  type    = string
  default = "2Gi"
}

variable "minio_helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "minio_helm_chart" {
  type    = string
  default = "minio"
}

variable "minio_version" {
  type    = string
  default = "12.1.3"
}

variable "argo_minio_secret_key" {
  type    = string
  default = ""
}

variable "argo_minio_access_key" {
  type    = string
  default = ""
}

variable "minio_deploy" {
  type = bool
}