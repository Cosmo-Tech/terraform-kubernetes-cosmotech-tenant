variable "grafana_loki_bucket_name" {
  type = string
}

variable "grafana_loki_s3_endpoint_url" {
  type = string
}

variable "grafana_loki_access_key_id" {
  type = string
}

variable "grafana_loki_secret_access_key" {
  type = string
}

variable "namespace" {
  type = string
}

variable "helm_repo_url" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "helm_release_name" {
  type    = string
  default = "loki"
}

variable "helm_chart_name" {
  type    = string
  default = "grafana-loki"
}

variable "chart_grafana_loki_version" {
  type = string
}