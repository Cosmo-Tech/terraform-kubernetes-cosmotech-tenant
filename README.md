<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./create-cert-manager | n/a |
| <a name="module_config_platform"></a> [config\_platform](#module\_config\_platform) | ./config-platform | n/a |
| <a name="module_create-argo"></a> [create-argo](#module\_create-argo) | ./create-argo | n/a |
| <a name="module_create-cosmotech-api"></a> [create-cosmotech-api](#module\_create-cosmotech-api) | ./create-cosmotech-api | n/a |
| <a name="module_create-minio"></a> [create-minio](#module\_create-minio) | ./create-minio | n/a |
| <a name="module_create-postgresql-db"></a> [create-postgresql-db](#module\_create-postgresql-db) | ./create-postgresql-db | n/a |
| <a name="module_create-rabbitmq"></a> [create-rabbitmq](#module\_create-rabbitmq) | ./create-rabbitmq | n/a |
| <a name="module_create-redis-stack"></a> [create-redis-stack](#module\_create-redis-stack) | ./create-redis-stack | n/a |
| <a name="module_create-tls"></a> [create-tls](#module\_create-tls) | ./create-secret-tls | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_namespace"></a> [allowed\_namespace](#input\_allowed\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_argo_deploy"></a> [argo\_deploy](#input\_argo\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_argo_version"></a> [argo\_version](#input\_argo\_version) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id of the app registration used to build this | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret of the app registration used to build this | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_chart_package_version"></a> [cosmotech\_api\_chart\_package\_version](#input\_cosmotech\_api\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version"></a> [cosmotech\_api\_version](#input\_cosmotech\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version_path"></a> [cosmotech\_api\_version\_path](#input\_cosmotech\_api\_version\_path) | n/a | `string` | n/a | yes |
| <a name="input_create_platform_config"></a> [create\_platform\_config](#input\_create\_platform\_config) | n/a | `bool` | n/a | yes |
| <a name="input_create_rabbitmq_secret"></a> [create\_rabbitmq\_secret](#input\_create\_rabbitmq\_secret) | n/a | `bool` | n/a | yes |
| <a name="input_deploy_api"></a> [deploy\_api](#input\_deploy\_api) | n/a | `bool` | n/a | yes |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_resource_group"></a> [kubernetes\_resource\_group](#input\_kubernetes\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_minio_deploy"></a> [minio\_deploy](#input\_minio\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_network_sp_client_id"></a> [network\_sp\_client\_id](#input\_network\_sp\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_postgresql_secrets_config_create"></a> [postgresql\_secrets\_config\_create](#input\_postgresql\_secrets\_config\_create) | n/a | `bool` | n/a | yes |
| <a name="input_redis_deploy"></a> [redis\_deploy](#input\_redis\_deploy) | n/a | `bool` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id | `string` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_tenant_sp_client_id"></a> [tenant\_sp\_client\_id](#input\_tenant\_sp\_client\_id) | The client\_id of the platform's service principal | `string` | n/a | yes |
| <a name="input_tenant_sp_client_secret"></a> [tenant\_sp\_client\_secret](#input\_tenant\_sp\_client\_secret) | The client\_secret of the platform's service principal | `string` | n/a | yes |
| <a name="input_vault_engine_secret"></a> [vault\_engine\_secret](#input\_vault\_engine\_secret) | n/a | `string` | n/a | yes |
| <a name="input_version_redis_cosmotech"></a> [version\_redis\_cosmotech](#input\_version\_redis\_cosmotech) | Redis version | `string` | n/a | yes |
| <a name="input_acr_login_password"></a> [acr\_login\_password](#input\_acr\_login\_password) | n/a | `string` | `""` | no |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | n/a | `string` | `""` | no |
| <a name="input_acr_login_server_url"></a> [acr\_login\_server\_url](#input\_acr\_login\_server\_url) | n/a | `string` | `""` | no |
| <a name="input_acr_login_username"></a> [acr\_login\_username](#input\_acr\_login\_username) | n/a | `string` | `""` | no |
| <a name="input_adx_ingestion_uri"></a> [adx\_ingestion\_uri](#input\_adx\_ingestion\_uri) | n/a | `string` | `""` | no |
| <a name="input_adx_uri"></a> [adx\_uri](#input\_adx\_uri) | n/a | `string` | `""` | no |
| <a name="input_api_replicas"></a> [api\_replicas](#input\_api\_replicas) | n/a | `number` | `1` | no |
| <a name="input_archive_ttl"></a> [archive\_ttl](#input\_archive\_ttl) | n/a | `string` | `"3d"` | no |
| <a name="input_argo_bucket_name"></a> [argo\_bucket\_name](#input\_argo\_bucket\_name) | n/a | `string` | `"argo-workflows"` | no |
| <a name="input_argo_database"></a> [argo\_database](#input\_argo\_database) | n/a | `string` | `"argo_workflows"` | no |
| <a name="input_argo_helm_chart"></a> [argo\_helm\_chart](#input\_argo\_helm\_chart) | n/a | `string` | `"argo-workflows"` | no |
| <a name="input_argo_helm_repo_url"></a> [argo\_helm\_repo\_url](#input\_argo\_helm\_repo\_url) | n/a | `string` | `"https://argoproj.github.io/argo-helm"` | no |
| <a name="input_argo_minio_access_key"></a> [argo\_minio\_access\_key](#input\_argo\_minio\_access\_key) | n/a | `string` | `""` | no |
| <a name="input_argo_minio_persistence_size"></a> [argo\_minio\_persistence\_size](#input\_argo\_minio\_persistence\_size) | n/a | `string` | `"16Gi"` | no |
| <a name="input_argo_minio_requests_memory"></a> [argo\_minio\_requests\_memory](#input\_argo\_minio\_requests\_memory) | n/a | `string` | `"2Gi"` | no |
| <a name="input_argo_minio_secret_key"></a> [argo\_minio\_secret\_key](#input\_argo\_minio\_secret\_key) | n/a | `string` | `""` | no |
| <a name="input_argo_postgresql_secret_name"></a> [argo\_postgresql\_secret\_name](#input\_argo\_postgresql\_secret\_name) | n/a | `string` | `"postgres-config"` | no |
| <a name="input_argo_postgresql_user"></a> [argo\_postgresql\_user](#input\_argo\_postgresql\_user) | n/a | `string` | `"argo"` | no |
| <a name="input_argo_service_account"></a> [argo\_service\_account](#input\_argo\_service\_account) | n/a | `string` | `""` | no |
| <a name="input_certificate_cert_content"></a> [certificate\_cert\_content](#input\_certificate\_cert\_content) | n/a | `string` | `""` | no |
| <a name="input_certificate_key_content"></a> [certificate\_key\_content](#input\_certificate\_key\_content) | n/a | `string` | `""` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_cosmos_key"></a> [cosmos\_key](#input\_cosmos\_key) | n/a | `string` | `""` | no |
| <a name="input_cosmos_uri"></a> [cosmos\_uri](#input\_cosmos\_uri) | n/a | `string` | `""` | no |
| <a name="input_cosmotech_api_admin_username"></a> [cosmotech\_api\_admin\_username](#input\_cosmotech\_api\_admin\_username) | n/a | `string` | `"cosmotech_api_admin"` | no |
| <a name="input_cosmotech_api_helm_chart"></a> [cosmotech\_api\_helm\_chart](#input\_cosmotech\_api\_helm\_chart) | n/a | `string` | `"cosmotech-api-chart"` | no |
| <a name="input_cosmotech_api_helm_release_name"></a> [cosmotech\_api\_helm\_release\_name](#input\_cosmotech\_api\_helm\_release\_name) | n/a | `string` | `"cosmotech-api"` | no |
| <a name="input_cosmotech_api_helm_repository"></a> [cosmotech\_api\_helm\_repository](#input\_cosmotech\_api\_helm\_repository) | n/a | `string` | `"oci://ghcr.io/cosmo-tech"` | no |
| <a name="input_cosmotech_api_ingress_enabled"></a> [cosmotech\_api\_ingress\_enabled](#input\_cosmotech\_api\_ingress\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cosmotech_api_persistence_size"></a> [cosmotech\_api\_persistence\_size](#input\_cosmotech\_api\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_cosmotech_api_persistence_storage_class"></a> [cosmotech\_api\_persistence\_storage\_class](#input\_cosmotech\_api\_persistence\_storage\_class) | n/a | `string` | `""` | no |
| <a name="input_cosmotech_api_reader_username"></a> [cosmotech\_api\_reader\_username](#input\_cosmotech\_api\_reader\_username) | n/a | `string` | `"cosmotech_api_reader"` | no |
| <a name="input_cosmotech_api_writer_username"></a> [cosmotech\_api\_writer\_username](#input\_cosmotech\_api\_writer\_username) | n/a | `string` | `"cosmotech_api_writer"` | no |
| <a name="input_eventbus_uri"></a> [eventbus\_uri](#input\_eventbus\_uri) | n/a | `string` | `""` | no |
| <a name="input_identity_authorization_url"></a> [identity\_authorization\_url](#input\_identity\_authorization\_url) | n/a | `string` | `""` | no |
| <a name="input_identity_token_url"></a> [identity\_token\_url](#input\_identity\_token\_url) | n/a | `string` | `""` | no |
| <a name="input_is_multitenant"></a> [is\_multitenant](#input\_is\_multitenant) | n/a | `bool` | `true` | no |
| <a name="input_list_apikey_allowed"></a> [list\_apikey\_allowed](#input\_list\_apikey\_allowed) | n/a | <pre>list(object({<br>    name           = string<br>    apiKey         = string<br>    associatedRole = string<br>    securedUris    = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "apiKey": "",<br>    "associatedRole": "",<br>    "name": "",<br>    "securedUris": []<br>  }<br>]</pre> | no |
| <a name="input_minio_helm_chart"></a> [minio\_helm\_chart](#input\_minio\_helm\_chart) | n/a | `string` | `"minio"` | no |
| <a name="input_minio_helm_repo_url"></a> [minio\_helm\_repo\_url](#input\_minio\_helm\_repo\_url) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_minio_version"></a> [minio\_version](#input\_minio\_version) | n/a | `string` | `"12.1.3"` | no |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_network_sp_client_secret"></a> [network\_sp\_client\_secret](#input\_network\_sp\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_postgresql_deploy"></a> [postgresql\_deploy](#input\_postgresql\_deploy) | n/a | `bool` | `true` | no |
| <a name="input_postgresql_helm_chart"></a> [postgresql\_helm\_chart](#input\_postgresql\_helm\_chart) | n/a | `string` | `"postgresql"` | no |
| <a name="input_postgresql_helm_repo_url"></a> [postgresql\_helm\_repo\_url](#input\_postgresql\_helm\_repo\_url) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_postgresql_initdb_secret_name"></a> [postgresql\_initdb\_secret\_name](#input\_postgresql\_initdb\_secret\_name) | n/a | `string` | `"postgres-initdb"` | no |
| <a name="input_postgresql_persistence_size"></a> [postgresql\_persistence\_size](#input\_postgresql\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_postgresql_secret_name"></a> [postgresql\_secret\_name](#input\_postgresql\_secret\_name) | n/a | `string` | `"postgres-config"` | no |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | n/a | `string` | `"11.6.12"` | no |
| <a name="input_rabbitmq_deploy"></a> [rabbitmq\_deploy](#input\_rabbitmq\_deploy) | Whether to create RabbitMQ resources | `bool` | `true` | no |
| <a name="input_rabbitmq_helm_chart"></a> [rabbitmq\_helm\_chart](#input\_rabbitmq\_helm\_chart) | n/a | `string` | `"rabbitmq"` | no |
| <a name="input_rabbitmq_helm_chart_version"></a> [rabbitmq\_helm\_chart\_version](#input\_rabbitmq\_helm\_chart\_version) | n/a | `string` | `"13.0.3"` | no |
| <a name="input_rabbitmq_helm_release_name"></a> [rabbitmq\_helm\_release\_name](#input\_rabbitmq\_helm\_release\_name) | n/a | `string` | `"rabbitmq"` | no |
| <a name="input_rabbitmq_helm_repo_url"></a> [rabbitmq\_helm\_repo\_url](#input\_rabbitmq\_helm\_repo\_url) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_rabbitmq_listener_username"></a> [rabbitmq\_listener\_username](#input\_rabbitmq\_listener\_username) | n/a | `string` | `"cosmotech_api_listener"` | no |
| <a name="input_rabbitmq_persistence_size"></a> [rabbitmq\_persistence\_size](#input\_rabbitmq\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_rabbitmq_sender_username"></a> [rabbitmq\_sender\_username](#input\_rabbitmq\_sender\_username) | n/a | `string` | `"cosmotech_run_sender"` | no |
| <a name="input_redis_admin_password"></a> [redis\_admin\_password](#input\_redis\_admin\_password) | n/a | `string` | `""` | no |
| <a name="input_redis_chart_version"></a> [redis\_chart\_version](#input\_redis\_chart\_version) | n/a | `string` | `"17.8.0"` | no |
| <a name="input_redis_helm_chart_name"></a> [redis\_helm\_chart\_name](#input\_redis\_helm\_chart\_name) | n/a | `string` | `"redis"` | no |
| <a name="input_redis_helm_release_name"></a> [redis\_helm\_release\_name](#input\_redis\_helm\_release\_name) | n/a | `string` | `"cosmotechredis"` | no |
| <a name="input_redis_helm_repo_url"></a> [redis\_helm\_repo\_url](#input\_redis\_helm\_repo\_url) | n/a | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| <a name="input_redis_persistence_size"></a> [redis\_persistence\_size](#input\_redis\_persistence\_size) | n/a | `string` | `"64Gi"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | `6379` | no |
| <a name="input_requeue_time"></a> [requeue\_time](#input\_requeue\_time) | n/a | `string` | `"1s"` | no |
| <a name="input_secret_tls_secret_name"></a> [secret\_tls\_secret\_name](#input\_secret\_tls\_secret\_name) | n/a | `string` | `"custom-tls-secret"` | no |
| <a name="input_storage_account_key"></a> [storage\_account\_key](#input\_storage\_account\_key) | n/a | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | `"let_s_encrypt"` | no |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_vault_address"></a> [vault\_address](#input\_vault\_address) | n/a | `string` | `"http://vault.vault.svc.cluster.local"` | no |
| <a name="input_vault_namespace"></a> [vault\_namespace](#input\_vault\_namespace) | n/a | `string` | `"vault"` | no |
| <a name="input_vault_sops_namespace"></a> [vault\_sops\_namespace](#input\_vault\_sops\_namespace) | n/a | `string` | `"vault-secrets-operator"` | no |
<!-- END_TF_DOCS -->