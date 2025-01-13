# Tenant Information

## Azure Subscription

Name  | Value
------- | --------
Azure Subscription Id | ${subscription_id}
Azure Resource Group Name | ${azure_resource_group}
Azure Location | ${azure_location}

## Container Registry

Name  | Value
------- | --------
Container Registry Name | ${acr_login_server}

## Azure Data Explorer

Name  | Deployed | Value
------- | -------- | --------
ADX Cluster Name | ${rds_deploy == "false" ? "✅" : "❌"} | ${adx_cluster_name}
ADX Cluster URI | ${rds_deploy == "false" ? "✅" : "❌"} | ${adx_cluster_uri}

## Result Data Service

Name  | Deployed
------- | --------
Result Data Service | ${rds_deploy == "true" ? "✅" : "❌"}

## Azure Storage Account

Item  | Value
------- | --------
Name | ${storage_name}

## Kubernetes tenant services

Service  | Deployed | Version | URL
------- | -------- | -------- | --------
Argo Workflows | ${argo_workflows_deploy == "true" ? "✅" : "❌"} | ${argo_workflows_version} | N/A
MinIO | ${minio_deploy == "true" ? "✅" : "❌"} | ${minio_version} | N/A
Postgresql | ${postgresql_deploy == "true" ? "✅" : "❌"} | ${postgresql_version} | N/A
Cosmo Tech API | ${api_deploy == "true" ? "✅" : "❌"} | ${api_version} | ${api_url}
Cosmo Tech Redis | ${redis_deploy == "true" ? "✅" : "❌"} | ${redis_version} | N/A

## Platform Information

Name  | Value
------- | --------
Platform Service Principal Name | ${platform_sp_name}
Platform Service Principal Client ID | ${platform_sp_client_id}
Platform Service Principal Object ID | ${platform_sp_object_id}

## Cosmo Tech API Information

Name  | Value
------- | --------
Swagger Service Principal Name | ${swagger_sp_name}
Swagger Service Principal Client ID | ${swagger_sp_client_id}

## Babylon Information

Name  | Value
------- | --------
Babylon Service Principal Name | ${babylon_sp_name}
Babylon Service Principal Client ID | ${babylon_sp_client_id}
