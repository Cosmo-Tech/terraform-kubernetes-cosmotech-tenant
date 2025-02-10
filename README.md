<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./create-cert-manager | n/a |
| <a name="module_create-api-deployment"></a> [create-api-deployment](#module\_create-api-deployment) | ./create-cosmotech-api-deployment | n/a |
| <a name="module_create-argo"></a> [create-argo](#module\_create-argo) | ./create-argo | n/a |
| <a name="module_create-cosmotech-api"></a> [create-cosmotech-api](#module\_create-cosmotech-api) | ./create-cosmotech-api | n/a |
| <a name="module_create-keycloak"></a> [create-keycloak](#module\_create-keycloak) | ./create-keycloak-realm | n/a |
| <a name="module_create-minio"></a> [create-minio](#module\_create-minio) | ./create-minio | n/a |
| <a name="module_create-modeling-api-deployment"></a> [create-modeling-api-deployment](#module\_create-modeling-api-deployment) | ./create-modeling-api-deployment | n/a |
| <a name="module_create-postgresql-db"></a> [create-postgresql-db](#module\_create-postgresql-db) | ./create-postgresql-db | n/a |
| <a name="module_create-rabbitmq"></a> [create-rabbitmq](#module\_create-rabbitmq) | ./create-rabbitmq | n/a |
| <a name="module_create-redis-stack"></a> [create-redis-stack](#module\_create-redis-stack) | ./create-redis-stack | n/a |
| <a name="module_create-seaweedfs"></a> [create-seaweedfs](#module\_create-seaweedfs) | ./create-seaweedfs | n/a |
| <a name="module_create-tls"></a> [create-tls](#module\_create-tls) | ./create-secret-tls | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.main_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/resources/namespace) | resource |
| [random_password.argo_minio_access_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.argo_minio_secret_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.redis_admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [time_sleep.wait_30_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [template_file.summary](https://registry.terraform.io/providers/hashicorp/template/2.2.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_login_password"></a> [acr\_login\_password](#input\_acr\_login\_password) | n/a | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | n/a | `string` | n/a | yes |
| <a name="input_acr_login_username"></a> [acr\_login\_username](#input\_acr\_login\_username) | n/a | `string` | n/a | yes |
| <a name="input_adx_ingestion_uri"></a> [adx\_ingestion\_uri](#input\_adx\_ingestion\_uri) | n/a | `string` | n/a | yes |
| <a name="input_adx_uri"></a> [adx\_uri](#input\_adx\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_chart_package_version"></a> [api\_chart\_package\_version](#input\_api\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_api_deploy"></a> [api\_deploy](#input\_api\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_api_deployment_chart_package_version"></a> [api\_deployment\_chart\_package\_version](#input\_api\_deployment\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_api_deployment_helm_chart"></a> [api\_deployment\_helm\_chart](#input\_api\_deployment\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_api_deployment_helm_release_name"></a> [api\_deployment\_helm\_release\_name](#input\_api\_deployment\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_deployment_helm_repository"></a> [api\_deployment\_helm\_repository](#input\_api\_deployment\_helm\_repository) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_docker_secret"></a> [api\_docker\_secret](#input\_api\_docker\_secret) | n/a | `string` | n/a | yes |
| <a name="input_api_helm_chart"></a> [api\_helm\_chart](#input\_api\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_api_helm_release_name"></a> [api\_helm\_release\_name](#input\_api\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_helm_repository"></a> [api\_helm\_repository](#input\_api\_helm\_repository) | n/a | `string` | n/a | yes |
| <a name="input_api_identifier_uri"></a> [api\_identifier\_uri](#input\_api\_identifier\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_ingress_type"></a> [api\_ingress\_type](#input\_api\_ingress\_type) | n/a | `string` | n/a | yes |
| <a name="input_api_is_multitenant"></a> [api\_is\_multitenant](#input\_api\_is\_multitenant) | n/a | `bool` | n/a | yes |
| <a name="input_api_list_apikey_allowed"></a> [api\_list\_apikey\_allowed](#input\_api\_list\_apikey\_allowed) | n/a | <pre>list(object({<br>    name           = string<br>    apiKey         = string<br>    associatedRole = string<br>    securedUris    = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_api_ngrok_host"></a> [api\_ngrok\_host](#input\_api\_ngrok\_host) | n/a | `string` | n/a | yes |
| <a name="input_api_persistence_size"></a> [api\_persistence\_size](#input\_api\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_api_persistence_storage_class"></a> [api\_persistence\_storage\_class](#input\_api\_persistence\_storage\_class) | n/a | `string` | n/a | yes |
| <a name="input_api_replicas"></a> [api\_replicas](#input\_api\_replicas) | n/a | `number` | n/a | yes |
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | n/a | `string` | n/a | yes |
| <a name="input_api_webhook_secret"></a> [api\_webhook\_secret](#input\_api\_webhook\_secret) | n/a | `string` | n/a | yes |
| <a name="input_argo_archive_ttl"></a> [argo\_archive\_ttl](#input\_argo\_archive\_ttl) | n/a | `string` | n/a | yes |
| <a name="input_argo_database"></a> [argo\_database](#input\_argo\_database) | n/a | `string` | n/a | yes |
| <a name="input_argo_deploy"></a> [argo\_deploy](#input\_argo\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_argo_helm_chart"></a> [argo\_helm\_chart](#input\_argo\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_argo_helm_repo_url"></a> [argo\_helm\_repo\_url](#input\_argo\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_postgresql_secret_name"></a> [argo\_postgresql\_secret\_name](#input\_argo\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_requeue_time"></a> [argo\_requeue\_time](#input\_argo\_requeue\_time) | n/a | `string` | n/a | yes |
| <a name="input_argo_s3_bucket_name"></a> [argo\_s3\_bucket\_name](#input\_argo\_s3\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_service_account"></a> [argo\_service\_account](#input\_argo\_service\_account) | n/a | `string` | n/a | yes |
| <a name="input_argo_version"></a> [argo\_version](#input\_argo\_version) | n/a | `string` | n/a | yes |
| <a name="input_cert_cluster_issuer_name"></a> [cert\_cluster\_issuer\_name](#input\_cert\_cluster\_issuer\_name) | n/a | `string` | n/a | yes |
| <a name="input_cert_tls_namespace"></a> [cert\_tls\_namespace](#input\_cert\_tls\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_cert_tls_secret_name"></a> [cert\_tls\_secret\_name](#input\_cert\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_ingress_enabled"></a> [cosmotech\_api\_ingress\_enabled](#input\_cosmotech\_api\_ingress\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_custom_tls_certificate_certificate"></a> [custom\_tls\_certificate\_certificate](#input\_custom\_tls\_certificate\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_custom_tls_certificate_key"></a> [custom\_tls\_certificate\_key](#input\_custom\_tls\_certificate\_key) | n/a | `string` | n/a | yes |
| <a name="input_custom_tls_secret_name"></a> [custom\_tls\_secret\_name](#input\_custom\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_deploy_cosmotech_api_deployment"></a> [deploy\_cosmotech\_api\_deployment](#input\_deploy\_cosmotech\_api\_deployment) | n/a | `bool` | n/a | yes |
| <a name="input_deploy_modeling_api_deployment"></a> [deploy\_modeling\_api\_deployment](#input\_deploy\_modeling\_api\_deployment) | n/a | `bool` | n/a | yes |
| <a name="input_deployment_chart_package_version"></a> [deployment\_chart\_package\_version](#input\_deployment\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_deployment_helm_chart"></a> [deployment\_helm\_chart](#input\_deployment\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_deployment_helm_release_name"></a> [deployment\_helm\_release\_name](#input\_deployment\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_deployment_helm_repository"></a> [deployment\_helm\_repository](#input\_deployment\_helm\_repository) | n/a | `string` | n/a | yes |
| <a name="input_event_listener_dns_name"></a> [event\_listener\_dns\_name](#input\_event\_listener\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_eventbus_uri"></a> [eventbus\_uri](#input\_eventbus\_uri) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_id"></a> [keycloak\_client\_id](#input\_keycloak\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_secret"></a> [keycloak\_client\_secret](#input\_keycloak\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_deploy"></a> [keycloak\_deploy](#input\_keycloak\_deploy) | Wether to create Keycloak resources fot this tenant :<br>- realm<br>- OpenID client & scopes<br>- roles<br>- Authentication flow<br>- Default user<br>After this deployment, you will need to manually set the authentication flow<br> as the default to the broker identification. To do so go to the Authentication menu.<br> On the new line with the "auto link user" flow, click the 3 dot at the end of the line<br>  and then "Bind flow". Then select **First broker login flow**.<br> You should have the newly created flow "auto link user" with the column Used by set to<br>  First broker login flow. | `bool` | n/a | yes |
| <a name="input_keycloak_password"></a> [keycloak\_password](#input\_keycloak\_password) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_realm_jwt_claim_api_client"></a> [keycloak\_realm\_jwt\_claim\_api\_client](#input\_keycloak\_realm\_jwt\_claim\_api\_client) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_realm_jwt_claim_web_client"></a> [keycloak\_realm\_jwt\_claim\_web\_client](#input\_keycloak\_realm\_jwt\_claim\_web\_client) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_url"></a> [keycloak\_url](#input\_keycloak\_url) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_username"></a> [keycloak\_username](#input\_keycloak\_username) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | The namespace of the tenant | `string` | n/a | yes |
| <a name="input_minio_argo_access_key"></a> [minio\_argo\_access\_key](#input\_minio\_argo\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_bucket_name"></a> [minio\_argo\_bucket\_name](#input\_minio\_argo\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_persistence_size"></a> [minio\_argo\_persistence\_size](#input\_minio\_argo\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_requests_memory"></a> [minio\_argo\_requests\_memory](#input\_minio\_argo\_requests\_memory) | n/a | `string` | n/a | yes |
| <a name="input_minio_argo_secret_key"></a> [minio\_argo\_secret\_key](#input\_minio\_argo\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_minio_helm_chart"></a> [minio\_helm\_chart](#input\_minio\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_minio_helm_repo_url"></a> [minio\_helm\_repo\_url](#input\_minio\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_minio_version"></a> [minio\_version](#input\_minio\_version) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_docker_secret"></a> [modeling\_api\_docker\_secret](#input\_modeling\_api\_docker\_secret) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_ingress_type"></a> [modeling\_api\_ingress\_type](#input\_modeling\_api\_ingress\_type) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_monitoring_enabled"></a> [modeling\_api\_monitoring\_enabled](#input\_modeling\_api\_monitoring\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_modeling_api_monitoring_namespace"></a> [modeling\_api\_monitoring\_namespace](#input\_modeling\_api\_monitoring\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_ngrok_host"></a> [modeling\_api\_ngrok\_host](#input\_modeling\_api\_ngrok\_host) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_persistence_storage_class"></a> [modeling\_api\_persistence\_storage\_class](#input\_modeling\_api\_persistence\_storage\_class) | n/a | `string` | n/a | yes |
| <a name="input_modeling_api_wehbook_secret"></a> [modeling\_api\_wehbook\_secret](#input\_modeling\_api\_wehbook\_secret) | n/a | `string` | n/a | yes |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `bool` | n/a | yes |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_network_client_id"></a> [network\_client\_id](#input\_network\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_postgres_release_name"></a> [postgres\_release\_name](#input\_postgres\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_admin_password"></a> [postgresql\_admin\_password](#input\_postgresql\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_admin_username"></a> [postgresql\_admin\_username](#input\_postgresql\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_argo_database"></a> [postgresql\_argo\_database](#input\_postgresql\_argo\_database) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_argo_user"></a> [postgresql\_argo\_user](#input\_postgresql\_argo\_user) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_admin_username"></a> [postgresql\_cosmotech\_api\_admin\_username](#input\_postgresql\_cosmotech\_api\_admin\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_reader_username"></a> [postgresql\_cosmotech\_api\_reader\_username](#input\_postgresql\_cosmotech\_api\_reader\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_cosmotech_api_writer_username"></a> [postgresql\_cosmotech\_api\_writer\_username](#input\_postgresql\_cosmotech\_api\_writer\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_deploy"></a> [postgresql\_deploy](#input\_postgresql\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_postgresql_helm_chart"></a> [postgresql\_helm\_chart](#input\_postgresql\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_helm_repo_url"></a> [postgresql\_helm\_repo\_url](#input\_postgresql\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_initdb_secret_name"></a> [postgresql\_initdb\_secret\_name](#input\_postgresql\_initdb\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_persistence_size"></a> [postgresql\_persistence\_size](#input\_postgresql\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_reader_password"></a> [postgresql\_reader\_password](#input\_postgresql\_reader\_password) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_reader_username"></a> [postgresql\_reader\_username](#input\_postgresql\_reader\_username) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_release_name"></a> [postgresql\_release\_name](#input\_postgresql\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_secret_name"></a> [postgresql\_secret\_name](#input\_postgresql\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_writer_password"></a> [postgresql\_writer\_password](#input\_postgresql\_writer\_password) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_writer_username"></a> [postgresql\_writer\_username](#input\_postgresql\_writer\_username) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_deploy"></a> [rabbitmq\_deploy](#input\_rabbitmq\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_rabbitmq_helm_chart"></a> [rabbitmq\_helm\_chart](#input\_rabbitmq\_helm\_chart) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_chart_version"></a> [rabbitmq\_helm\_chart\_version](#input\_rabbitmq\_helm\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_release_name"></a> [rabbitmq\_helm\_release\_name](#input\_rabbitmq\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_helm_repo_url"></a> [rabbitmq\_helm\_repo\_url](#input\_rabbitmq\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_listener_password"></a> [rabbitmq\_listener\_password](#input\_rabbitmq\_listener\_password) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_listener_username"></a> [rabbitmq\_listener\_username](#input\_rabbitmq\_listener\_username) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_namespace"></a> [rabbitmq\_namespace](#input\_rabbitmq\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_persistence_size"></a> [rabbitmq\_persistence\_size](#input\_rabbitmq\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_release_name"></a> [rabbitmq\_release\_name](#input\_rabbitmq\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_sender_password"></a> [rabbitmq\_sender\_password](#input\_rabbitmq\_sender\_password) | n/a | `string` | n/a | yes |
| <a name="input_rabbitmq_sender_username"></a> [rabbitmq\_sender\_username](#input\_rabbitmq\_sender\_username) | n/a | `string` | n/a | yes |
| <a name="input_redis_admin_password"></a> [redis\_admin\_password](#input\_redis\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_redis_chart_version"></a> [redis\_chart\_version](#input\_redis\_chart\_version) | n/a | `string` | n/a | yes |
| <a name="input_redis_cosmotech_version"></a> [redis\_cosmotech\_version](#input\_redis\_cosmotech\_version) | n/a | `string` | n/a | yes |
| <a name="input_redis_deploy"></a> [redis\_deploy](#input\_redis\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_redis_helm_chart_name"></a> [redis\_helm\_chart\_name](#input\_redis\_helm\_chart\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_helm_release_name"></a> [redis\_helm\_release\_name](#input\_redis\_helm\_release\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_helm_repo_url"></a> [redis\_helm\_repo\_url](#input\_redis\_helm\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_redis_persistence_size"></a> [redis\_persistence\_size](#input\_redis\_persistence\_size) | n/a | `string` | n/a | yes |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | n/a | yes |
| <a name="input_redis_pv_capacity"></a> [redis\_pv\_capacity](#input\_redis\_pv\_capacity) | n/a | `string` | n/a | yes |
| <a name="input_s3_credentials_secret"></a> [s3\_credentials\_secret](#input\_s3\_credentials\_secret) | n/a | `string` | n/a | yes |
| <a name="input_s3_endpoint"></a> [s3\_endpoint](#input\_s3\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_s3_password_key"></a> [s3\_password\_key](#input\_s3\_password\_key) | n/a | `string` | n/a | yes |
| <a name="input_s3_username_key"></a> [s3\_username\_key](#input\_s3\_username\_key) | n/a | `string` | n/a | yes |
| <a name="input_seaweedfs_chart_version"></a> [seaweedfs\_chart\_version](#input\_seaweedfs\_chart\_version) | SeaweedFS chart version | `string` | n/a | yes |
| <a name="input_storage_account_key"></a> [storage\_account\_key](#input\_storage\_account\_key) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_tenant_client_id"></a> [tenant\_client\_id](#input\_tenant\_client\_id) | The client\_id of the platform's service principal | `string` | n/a | yes |
| <a name="input_tenant_client_secret"></a> [tenant\_client\_secret](#input\_tenant\_client\_secret) | The client\_secret of the platform's service principal | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | n/a | yes |
| <a name="input_tls_namespace"></a> [tls\_namespace](#input\_tls\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_use_internal_result_services"></a> [use\_internal\_result\_services](#input\_use\_internal\_result\_services) | n/a | `bool` | n/a | yes |
| <a name="input_use_minio_storage"></a> [use\_minio\_storage](#input\_use\_minio\_storage) | n/a | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rendered"></a> [rendered](#output\_rendered) | n/a |
<!-- END_TF_DOCS -->