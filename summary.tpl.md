# Tenant Information

## Container Registry

Name  | Value
------- | --------
Container Registry Name | ${acr_login_server}

## Result Data Service

Name  | Deployed
------- | --------
Result Data Service | ${rds_deploy == "true" ? "✅" : "❌"}

## Kubernetes tenant services

Service  | Deployed | Version | URL
------- | -------- | -------- | --------
Argo Workflows | ${argo_workflows_deploy == "true" ? "✅" : "❌"} | ${argo_workflows_version} | N/A
MinIO | ${minio_deploy == "true" ? "✅" : "❌"} | ${minio_version} | N/A
Rabbitmq | ${rabbitmq_deploy == "true" ? "✅" : "❌"} | ${rabbitmq_deploy} | N/A
Seaweedfs | ${minio_deploy == "false" ? "✅" : "❌"} | ${seaweedfs_chart_version} | N/A
Postgresql | ${postgresql_deploy == "true" ? "✅" : "❌"} | ${postgresql_version} | N/A
Cosmo Tech API | ${api_deploy == "true" ? "✅" : "❌"} | ${api_version} | ${api_url}
Cosmo Tech Redis | ${redis_deploy == "true" ? "✅" : "❌"} | ${redis_version} | N/A

## Platform Information

Name  | Value
------- | --------
Platform Service Principal Name | ${platform_sp_name}
Platform Service Principal Client ID | ${platform_sp_client_id}

## Cosmo Tech API Information

Name  | Value
------- | --------
Swagger Service Principal Name | ${swagger_sp_name}
Swagger Service Principal Client ID | ${swagger_sp_client_id}
