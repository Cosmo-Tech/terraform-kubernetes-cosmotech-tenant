output "out_argo_workflows_release_name" {
  value = helm_release.argo.metadata.0.name
}

output "out_argo_workflows_service_account" {
  value = local.argo_service_account
}
