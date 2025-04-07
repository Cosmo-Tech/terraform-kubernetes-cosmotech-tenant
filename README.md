<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 3.22.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.1.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.1 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./create-cert-manager | n/a |
| <a name="module_create-argo"></a> [create-argo](#module\_create-argo) | ./create-argo | n/a |
| <a name="module_create-cosmotech-api"></a> [create-cosmotech-api](#module\_create-cosmotech-api) | ./create-cosmotech-api | n/a |
| <a name="module_create-grafana-dashboard"></a> [create-grafana-dashboard](#module\_create-grafana-dashboard) | ./create-grafana-dashboard | n/a |
| <a name="module_create-keycloak"></a> [create-keycloak](#module\_create-keycloak) | ./create-keycloak-realm | n/a |
| <a name="module_create-minio"></a> [create-minio](#module\_create-minio) | ./create-minio | n/a |
| <a name="module_create-postgresql-db"></a> [create-postgresql-db](#module\_create-postgresql-db) | ./create-postgresql-db | n/a |
| <a name="module_create-rabbitmq"></a> [create-rabbitmq](#module\_create-rabbitmq) | ./create-rabbitmq | n/a |
| <a name="module_create-redis-stack"></a> [create-redis-stack](#module\_create-redis-stack) | ./create-redis-stack | n/a |
| <a name="module_create-seaweedfs"></a> [create-seaweedfs](#module\_create-seaweedfs) | ./create-seaweedfs | n/a |
| <a name="module_create-tls"></a> [create-tls](#module\_create-tls) | ./create-secret-tls | n/a |
| <a name="module_deploy-pvc-minio"></a> [deploy-pvc-minio](#module\_deploy-pvc-minio) | ./persistence-claim-minio | n/a |
| <a name="module_deploy-pvc-postgres"></a> [deploy-pvc-postgres](#module\_deploy-pvc-postgres) | ./persistence-claim-postgres | n/a |
| <a name="module_deploy-pvc-redis"></a> [deploy-pvc-redis](#module\_deploy-pvc-redis) | ./persistence-claim-redis | n/a |
| <a name="module_deploy-pvc-seaweedfs"></a> [deploy-pvc-seaweedfs](#module\_deploy-pvc-seaweedfs) | ./persistence-claim-seaweedfs | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.summary](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |
| [terraform_remote_state.tenant_infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_acr_login_password"></a> [api\_acr\_login\_password](#input\_api\_acr\_login\_password) | n/a | `string` | n/a | yes |
| <a name="input_api_acr_login_server"></a> [api\_acr\_login\_server](#input\_api\_acr\_login\_server) | n/a | `string` | n/a | yes |
| <a name="input_api_acr_login_server_url"></a> [api\_acr\_login\_server\_url](#input\_api\_acr\_login\_server\_url) | n/a | `string` | n/a | yes |
| <a name="input_api_acr_login_username"></a> [api\_acr\_login\_username](#input\_api\_acr\_login\_username) | n/a | `string` | n/a | yes |
| <a name="input_api_adx_ingestion_uri"></a> [api\_adx\_ingestion\_uri](#input\_api\_adx\_ingestion\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_adx_uri"></a> [api\_adx\_uri](#input\_api\_adx\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_auth_provider"></a> [api\_auth\_provider](#input\_api\_auth\_provider) | n/a | `string` | n/a | yes |
| <a name="input_api_chart_package_version"></a> [api\_chart\_package\_version](#input\_api\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_api_deploy"></a> [api\_deploy](#input\_api\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_eventbus_uri"></a> [api\_eventbus\_uri](#input\_api\_eventbus\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_graph_enabled"></a> [api\_graph\_enabled](#input\_api\_graph\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_api_helm_chart"></a> [api\_helm\_chart](#input\_api\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_api_helm_release_name"></a> [api\_helm\_release\_name](#input\_api\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_helm_repository"></a> [api\_helm\_repository](#input\_api\_helm\_repository) | n/a | `string` | n/a | yes |
| <a name="input_api_identifier_uri"></a> [api\_identifier\_uri](#input\_api\_identifier\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_identity_provider"></a> [api\_identity\_provider](#input\_api\_identity\_provider) | n/a | `any` | n/a | yes |
| <a name="input_api_ingress_enabled"></a> [api\_ingress\_enabled](#input\_api\_ingress\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_api_is_multitenant"></a> [api\_is\_multitenant](#input\_api\_is\_multitenant) | n/a | `bool` | n/a | yes |
| <a name="input_api_list_apikey_allowed"></a> [api\_list\_apikey\_allowed](#input\_api\_list\_apikey\_allowed) | n/a | <pre>list(object({<br>    name           = string<br>    apiKey         = string<br>    associatedRole = string<br>    securedUris    = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_api_list_authorized_mime_types"></a> [api\_list\_authorized\_mime\_types](#input\_api\_list\_authorized\_mime\_types) | n/a | `list(string)` | n/a | yes |
| <a name="input_api_max_file_size"></a> [api\_max\_file\_size](#input\_api\_max\_file\_size) | n/a | `string` | n/a | yes |
| <a name="input_api_max_request_size"></a> [api\_max\_request\_size](#input\_api\_max\_request\_size) | n/a | `string` | n/a | yes |
| <a name="input_api_persistence_size"></a> [api\_persistence\_size](#input\_api\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_api_persistence_storage_class"></a> [api\_persistence\_storage\_class](#input\_api\_persistence\_storage\_class) | n/a | `string` | n/a | yes |
| <a name="input_api_replicas"></a> [api\_replicas](#input\_api\_replicas) | n/a | `number` | n/a | yes |
| <a name="input_api_storage_account_key"></a> [api\_storage\_account\_key](#input\_api\_storage\_account\_key) | n/a | `string` | n/a | yes |
| <a name="input_api_storage_account_name"></a> [api\_storage\_account\_name](#input\_api\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | n/a | `string` | n/a | yes |
| <a name="input_argo_archive_ttl"></a> [argo\_archive\_ttl](#input\_argo\_archive\_ttl) | n/a | `string` | n/a | yes |
| <a name="input_argo_bucket_name"></a> [argo\_bucket\_name](#input\_argo\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_cloud_provider"></a> [argo\_cloud\_provider](#input\_argo\_cloud\_provider) | n/a | `string` | n/a | yes |
| <a name="input_argo_database"></a> [argo\_database](#input\_argo\_database) | n/a | `string` | n/a | yes |
| <a name="input_argo_deploy"></a> [argo\_deploy](#input\_argo\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_argo_helm_chart"></a> [argo\_helm\_chart](#input\_argo\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_argo_helm_chart_version"></a> [argo\_helm\_chart\_version](#input\_argo\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_argo_helm_repo_url"></a> [argo\_helm\_repo\_url](#input\_argo\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_install_crds"></a> [argo\_install\_crds](#input\_argo\_install\_crds) | n/a | `bool` | n/a | yes |
| <a name="input_argo_postgres_release_name"></a> [argo\_postgres\_release\_name](#input\_argo\_postgres\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_postgresql_secret_name"></a> [argo\_postgresql\_secret\_name](#input\_argo\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_requeue_time"></a> [argo\_requeue\_time](#input\_argo\_requeue\_time) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_bucket_name"></a> [argo\_s3\_bucket\_name](#input\_argo\_s3\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_credentials_secret"></a> [argo\_s3\_credentials\_secret](#input\_argo\_s3\_credentials\_secret) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_endpoint"></a> [argo\_s3\_endpoint](#input\_argo\_s3\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_password_key"></a> [argo\_s3\_password\_key](#input\_argo\_s3\_password\_key) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_username_key"></a> [argo\_s3\_username\_key](#input\_argo\_s3\_username\_key) | n/a | `string` | n/a | yes |
| <a name="input_argo_service_account"></a> [argo\_service\_account](#input\_argo\_service\_account) | n/a | `string` | n/a | yes |
| <a name="input_cert_cluster_issuer_name"></a> [cert\_cluster\_issuer\_name](#input\_cert\_cluster\_issuer\_name) | n/a | `string` | n/a | yes |
| <a name="input_cert_tls_namespace"></a> [cert\_tls\_namespace](#input\_cert\_tls\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_cert_tls_secret_name"></a> [cert\_tls\_secret\_name](#input\_cert\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_certificate_cert_content"></a> [certificate\_cert\_content](#input\_certificate\_cert\_content) | n/a | `string` | n/a | yes |
| <a name="input_certificate_key_content"></a> [certificate\_key\_content](#input\_certificate\_key\_content) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_cloud_provider"></a> [cloud\_provider](#input\_cloud\_provider) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_create_rabbitmq_secret"></a> [create\_rabbitmq\_secret](#input\_create\_rabbitmq\_secret) | n/a | `bool` | n/a | yes |
| <a name="input_custom_tls_certificate_certificate"></a> [custom\_tls\_certificate\_certificate](#input\_custom\_tls\_certificate\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_custom_tls_certificate_key"></a> [custom\_tls\_certificate\_key](#input\_custom\_tls\_certificate\_key) | n/a | `string` | n/a | yes |
| <a name="input_custom_tls_namespace"></a> [custom\_tls\_namespace](#input\_custom\_tls\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_custom_tls_secret_name"></a> [custom\_tls\_secret\_name](#input\_custom\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_first_tenant_in_cluster"></a> [first\_tenant\_in\_cluster](#input\_first\_tenant\_in\_cluster) | n/a | `bool` | n/a | yes |
| <a name="input_grafana_admin_password"></a> [grafana\_admin\_password](#input\_grafana\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_grafana_admin_user"></a> [grafana\_admin\_user](#input\_grafana\_admin\_user) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_add_identity_provider_azure"></a> [keycloak\_add\_identity\_provider\_azure](#input\_keycloak\_add\_identity\_provider\_azure) | n/a | `bool` | n/a | yes |
| <a name="input_keycloak_client_id"></a> [keycloak\_client\_id](#input\_keycloak\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_secret"></a> [keycloak\_client\_secret](#input\_keycloak\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_deploy"></a> [keycloak\_deploy](#input\_keycloak\_deploy) | Wether to create Keycloak resources fot this tenant :<br>- realm<br>- OpenID client & scopes<br>- roles<br>- Authentication flow<br>- Default user<br>After this deployment, you will need to manually set the authentication flow<br> as the default to the broker identification. To do so go to the Authentication menu.<br> On the new line with the "auto link user" flow, click the 3 dot at the end of the line<br>  and then "Bind flow". Then select **First broker login flow**.<br> You should have the newly created flow "auto link user" with the column Used by set to<br>  First broker login flow. | `bool` | n/a | yes |
| <a name="input_keycloak_password"></a> [keycloak\_password](#input\_keycloak\_password) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_realm_jwt_claim_api_client"></a> [keycloak\_realm\_jwt\_claim\_api\_client](#input\_keycloak\_realm\_jwt\_claim\_api\_client) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_realm_jwt_claim_web_client"></a> [keycloak\_realm\_jwt\_claim\_web\_client](#input\_keycloak\_realm\_jwt\_claim\_web\_client) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_url"></a> [keycloak\_url](#input\_keycloak\_url) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_user_app_role"></a> [keycloak\_user\_app\_role](#input\_keycloak\_user\_app\_role) | n/a | `list(string)` | n/a | yes |
| <a name="input_keycloak_username"></a> [keycloak\_username](#input\_keycloak\_username) | n/a | `string` | n/a | yes |
| <a name="input_kube_config"></a> [kube\_config](#input\_kube\_config) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_cluster_admin_activate"></a> [kubernetes\_cluster\_admin\_activate](#input\_kubernetes\_cluster\_admin\_activate) | n/a | `bool` | n/a | yes |
| <a name="input_kubernetes_resource_group"></a> [kubernetes\_resource\_group](#input\_kubernetes\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_access_key"></a> [minio\_argo\_access\_key](#input\_minio\_argo\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_bucket_name"></a> [minio\_argo\_bucket\_name](#input\_minio\_argo\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_persistence_size"></a> [minio\_argo\_persistence\_size](#input\_minio\_argo\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_requests_memory"></a> [minio\_argo\_requests\_memory](#input\_minio\_argo\_requests\_memory) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_secret_key"></a> [minio\_argo\_secret\_key](#input\_minio\_argo\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_minio_deploy"></a> [minio\_deploy](#input\_minio\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_minio_existing_pvc_name"></a> [minio\_existing\_pvc\_name](#input\_minio\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_minio_helm_chart"></a> [minio\_helm\_chart](#input\_minio\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_minio_helm_repo_url"></a> [minio\_helm\_repo\_url](#input\_minio\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_minio_requests_memory"></a> [minio\_requests\_memory](#input\_minio\_requests\_memory) | n/a | `string` | n/a | yes |
| <a name="input_minio_version"></a> [minio\_version](#input\_minio\_version) | n/a | `string` | n/a | yes |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_network_sp_client_id"></a> [network\_sp\_client\_id](#input\_network\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_network_sp_client_secret"></a> [network\_sp\_client\_secret](#input\_network\_sp\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_argo_database"></a> [postgresql\_argo\_database](#input\_postgresql\_argo\_database) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_argo_user"></a> [postgresql\_argo\_user](#input\_postgresql\_argo\_user) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_admin_username"></a> [postgresql\_cosmotech\_api\_admin\_username](#input\_postgresql\_cosmotech\_api\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_reader_username"></a> [postgresql\_cosmotech\_api\_reader\_username](#input\_postgresql\_cosmotech\_api\_reader\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_writer_username"></a> [postgresql\_cosmotech\_api\_writer\_username](#input\_postgresql\_cosmotech\_api\_writer\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_deploy"></a> [postgresql\_deploy](#input\_postgresql\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_postgresql_existing_pvc_name"></a> [postgresql\_existing\_pvc\_name](#input\_postgresql\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_helm_chart"></a> [postgresql\_helm\_chart](#input\_postgresql\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_helm_repo_url"></a> [postgresql\_helm\_repo\_url](#input\_postgresql\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_initdb_secret_name"></a> [postgresql\_initdb\_secret\_name](#input\_postgresql\_initdb\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_persistence_size"></a> [postgresql\_persistence\_size](#input\_postgresql\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_secret_name"></a> [postgresql\_secret\_name](#input\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_secrets_config_create"></a> [postgresql\_secrets\_config\_create](#input\_postgresql\_secrets\_config\_create) | n/a | `bool` | n/a | yes |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | n/a | `string` | n/a | yes |
| <a name="input_pvc_minio_deploy"></a> [pvc\_minio\_deploy](#input\_pvc\_minio\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_pvc_minio_disk_name"></a> [pvc\_minio\_disk\_name](#input\_pvc\_minio\_disk\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_minio_storage_accessmode"></a> [pvc\_minio\_storage\_accessmode](#input\_pvc\_minio\_storage\_accessmode) | n/a | `string` | n/a | yes |
| <a name="input_pvc_minio_storage_class_name"></a> [pvc\_minio\_storage\_class\_name](#input\_pvc\_minio\_storage\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_minio_storage_gbi"></a> [pvc\_minio\_storage\_gbi](#input\_pvc\_minio\_storage\_gbi) | n/a | `string` | n/a | yes |
| <a name="input_pvc_postgres_deploy"></a> [pvc\_postgres\_deploy](#input\_pvc\_postgres\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_pvc_postgres_disk_name"></a> [pvc\_postgres\_disk\_name](#input\_pvc\_postgres\_disk\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_postgres_storage_accessmode"></a> [pvc\_postgres\_storage\_accessmode](#input\_pvc\_postgres\_storage\_accessmode) | n/a | `string` | n/a | yes |
| <a name="input_pvc_postgres_storage_class_name"></a> [pvc\_postgres\_storage\_class\_name](#input\_pvc\_postgres\_storage\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_postgres_storage_gbi"></a> [pvc\_postgres\_storage\_gbi](#input\_pvc\_postgres\_storage\_gbi) | n/a | `string` | n/a | yes |
| <a name="input_pvc_redis_deploy"></a> [pvc\_redis\_deploy](#input\_pvc\_redis\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_pvc_redis_disk_master_name"></a> [pvc\_redis\_disk\_master\_name](#input\_pvc\_redis\_disk\_master\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_redis_disk_replica_name"></a> [pvc\_redis\_disk\_replica\_name](#input\_pvc\_redis\_disk\_replica\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_redis_storage_accessmode"></a> [pvc\_redis\_storage\_accessmode](#input\_pvc\_redis\_storage\_accessmode) | n/a | `string` | n/a | yes |
| <a name="input_pvc_redis_storage_class_name"></a> [pvc\_redis\_storage\_class\_name](#input\_pvc\_redis\_storage\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_redis_storage_gbi"></a> [pvc\_redis\_storage\_gbi](#input\_pvc\_redis\_storage\_gbi) | n/a | `string` | n/a | yes |
| <a name="input_pvc_seaweedfs_deploy"></a> [pvc\_seaweedfs\_deploy](#input\_pvc\_seaweedfs\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_pvc_seaweedfs_disk_master_name"></a> [pvc\_seaweedfs\_disk\_master\_name](#input\_pvc\_seaweedfs\_disk\_master\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_seaweedfs_disk_volume_name"></a> [pvc\_seaweedfs\_disk\_volume\_name](#input\_pvc\_seaweedfs\_disk\_volume\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_seaweedfs_storage_accessmode"></a> [pvc\_seaweedfs\_storage\_accessmode](#input\_pvc\_seaweedfs\_storage\_accessmode) | n/a | `string` | n/a | yes |
| <a name="input_pvc_seaweedfs_storage_class_name"></a> [pvc\_seaweedfs\_storage\_class\_name](#input\_pvc\_seaweedfs\_storage\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_pvc_seaweedfs_storage_gbi"></a> [pvc\_seaweedfs\_storage\_gbi](#input\_pvc\_seaweedfs\_storage\_gbi) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_deploy"></a> [rabbitmq\_deploy](#input\_rabbitmq\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_rabbitmq_helm_chart"></a> [rabbitmq\_helm\_chart](#input\_rabbitmq\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_chart_version"></a> [rabbitmq\_helm\_chart\_version](#input\_rabbitmq\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_release_name"></a> [rabbitmq\_helm\_release\_name](#input\_rabbitmq\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_repo_url"></a> [rabbitmq\_helm\_repo\_url](#input\_rabbitmq\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_listener_username"></a> [rabbitmq\_listener\_username](#input\_rabbitmq\_listener\_username) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_namespace"></a> [rabbitmq\_namespace](#input\_rabbitmq\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_persistence_size"></a> [rabbitmq\_persistence\_size](#input\_rabbitmq\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_sender_username"></a> [rabbitmq\_sender\_username](#input\_rabbitmq\_sender\_username) | n/a | `string` | n/a | yes |
| <a name="input_redis_admin_password"></a> [redis\_admin\_password](#input\_redis\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_redis_chart_version"></a> [redis\_chart\_version](#input\_redis\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_redis_cosmotech_version"></a> [redis\_cosmotech\_version](#input\_redis\_cosmotech\_version) | n/a | `string` | n/a | yes |
| <a name="input_redis_deploy"></a> [redis\_deploy](#input\_redis\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_redis_helm_chart_name"></a> [redis\_helm\_chart\_name](#input\_redis\_helm\_chart\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_helm_release_name"></a> [redis\_helm\_release\_name](#input\_redis\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_helm_repo_url"></a> [redis\_helm\_repo\_url](#input\_redis\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_redis_master_existing_pvc_name"></a> [redis\_master\_existing\_pvc\_name](#input\_redis\_master\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_persistence_size"></a> [redis\_persistence\_size](#input\_redis\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | n/a | yes |
| <a name="input_redis_pvc_storage_class_name"></a> [redis\_pvc\_storage\_class\_name](#input\_redis\_pvc\_storage\_class\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_replica_existing_pvc_name"></a> [redis\_replica\_existing\_pvc\_name](#input\_redis\_replica\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_resources"></a> [redis\_resources](#input\_redis\_resources) | n/a | <pre>object({<br>    limits = object({<br>      cpu    = string<br>      memory = string<br>    })<br>    requests = object({<br>      cpu    = string<br>      memory = string<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_seaweedfs_database"></a> [seaweedfs\_database](#input\_seaweedfs\_database) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_helm_chart_name"></a> [seaweedfs\_helm\_chart\_name](#input\_seaweedfs\_helm\_chart\_name) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_helm_chart_repository"></a> [seaweedfs\_helm\_chart\_repository](#input\_seaweedfs\_helm\_chart\_repository) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_helm_chart_version"></a> [seaweedfs\_helm\_chart\_version](#input\_seaweedfs\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_master_existing_pvc_name"></a> [seaweedfs\_master\_existing\_pvc\_name](#input\_seaweedfs\_master\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_postgresql_port"></a> [seaweedfs\_postgresql\_port](#input\_seaweedfs\_postgresql\_port) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_username"></a> [seaweedfs\_username](#input\_seaweedfs\_username) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_volume_existing_pvc_name"></a> [seaweedfs\_volume\_existing\_pvc\_name](#input\_seaweedfs\_volume\_existing\_pvc\_name) | n/a | `string` | n/a | yes |
| <a name="input_secret_tls_secret_name"></a> [secret\_tls\_secret\_name](#input\_secret\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_tenant_sp_client_id"></a> [tenant\_sp\_client\_id](#input\_tenant\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_sp_client_secret"></a> [tenant\_sp\_client\_secret](#input\_tenant\_sp\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_tf_access_key"></a> [tf\_access\_key](#input\_tf\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_tf_blob_name_tenant_infra"></a> [tf\_blob\_name\_tenant\_infra](#input\_tf\_blob\_name\_tenant\_infra) | n/a | `string` | n/a | yes |
| <a name="input_tf_container_name"></a> [tf\_container\_name](#input\_tf\_container\_name) | n/a | `string` | n/a | yes |
| <a name="input_tf_resource_group_name"></a> [tf\_resource\_group\_name](#input\_tf\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tf_storage_account_name"></a> [tf\_storage\_account\_name](#input\_tf\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | n/a | yes |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | n/a | `string` | n/a | yes |
| <a name="input_vault_allowed_namespace"></a> [vault\_allowed\_namespace](#input\_vault\_allowed\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_vault_deploy"></a> [vault\_deploy](#input\_vault\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_vault_engine_secret"></a> [vault\_engine\_secret](#input\_vault\_engine\_secret) | n/a | `string` | n/a | yes |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_vault_organization"></a> [vault\_organization](#input\_vault\_organization) | n/a | `string` | n/a | yes |
| <a name="input_vault_sops_namespace"></a> [vault\_sops\_namespace](#input\_vault\_sops\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_dashboard_redis_auth_user"></a> [dashboard\_redis\_auth\_user](#input\_dashboard\_redis\_auth\_user) | n/a | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | n/a |
<!-- END_TF_DOCS -->