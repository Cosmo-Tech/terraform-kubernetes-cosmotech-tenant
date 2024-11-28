variable "chart_grafana_loki_version" {
  description = "Grafana-loki chart version"
  type        = string
  default     = "4.6.23"
}

variable "grafana_loki_bucket_name" {
  type    = string
  default = "grafana-loki"
}

