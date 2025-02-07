locals {
  local_instance_name            = "${var.helm_release_name}-${var.kubernetes_tenant_namespace}"
  

  values_modeling_api = {
    "MONITORING_ENABLED"            = var.monitoring_enabled
    "MONITORING_NAMESPACE"          = var.monitoring_namespace
    "NAMESPACE"                     = var.kubernetes_tenant_namespace
    "COSMOTECH_API_DNS_NAME"        = var.api_dns_name
    "PERSISTENCE_STORAGE_CLASS"     = var.persistence_storage_class
    "WEBHOOK_SECRET"                = var.wehbook_secret
    "DOCKER_SECRET"                 = var.docker_secret
    "ARGO_SERVICE_ACCOUNT"          = var.argo_service_account
    "ARGO_RELEASE_NAME"             = var.argo_release_name
    "HELM_RELEASE_NAME"             = var.helm_release_name
    "INGRESS_TYPE"                  = var.ingress_type
    "NGROK_HOST"                    = var.ngrok_host
  }
}

resource "helm_release" "modeling-api-deployment" {
  name       = local.local_instance_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.chart_package_version
  namespace  = var.kubernetes_tenant_namespace

  reset_values = true
  timeout      = 600

  values = [
    templatefile("${path.module}/values-modeling-api.yaml", local.values_modeling_api)
  ]
}
