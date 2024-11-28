<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 4.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.20.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./create-cert-manager | n/a |
| <a name="module_create-argo"></a> [create-argo](#module\_create-argo) | ./create-argo | n/a |
| <a name="module_create-cosmotech-api"></a> [create-cosmotech-api](#module\_create-cosmotech-api) | ./create-cosmotech-api | n/a |
| <a name="module_create-grafana-loki"></a> [create-grafana-loki](#module\_create-grafana-loki) | ./create-grafana-loki | n/a |
| <a name="module_create-keycloak"></a> [create-keycloak](#module\_create-keycloak) | ./create-keycloak-realm | n/a |
| <a name="module_create-minio"></a> [create-minio](#module\_create-minio) | ./create-minio | n/a |
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_login_password"></a> [acr\_login\_password](#input\_acr\_login\_password) | n/a | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | n/a | `string` | n/a | yes |
| <a name="input_acr_login_username"></a> [acr\_login\_username](#input\_acr\_login\_username) | n/a | `string` | n/a | yes |
| <a name="input_adx_ingestion_uri"></a> [adx\_ingestion\_uri](#input\_adx\_ingestion\_uri) | n/a | `string` | n/a | yes |
| <a name="input_adx_uri"></a> [adx\_uri](#input\_adx\_uri) | n/a | `string` | n/a | yes |
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_chart_package_version"></a> [chart\_package\_version](#input\_chart\_package\_version) | n/a | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id of the app registration used to build this | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret of the app registration used to build this | `string` | n/a | yes |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version"></a> [cosmotech\_api\_version](#input\_cosmotech\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_cosmotech_api_version_path"></a> [cosmotech\_api\_version\_path](#input\_cosmotech\_api\_version\_path) | n/a | `string` | n/a | yes |
| <a name="input_eventbus_uri"></a> [eventbus\_uri](#input\_eventbus\_uri) | n/a | `string` | n/a | yes |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_client_id"></a> [keycloak\_client\_id](#input\_keycloak\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_password"></a> [keycloak\_password](#input\_keycloak\_password) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_url"></a> [keycloak\_url](#input\_keycloak\_url) | n/a | `string` | n/a | yes |
| <a name="input_keycloak_username"></a> [keycloak\_username](#input\_keycloak\_username) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_network_client_id"></a> [network\_client\_id](#input\_network\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_key"></a> [storage\_account\_key](#input\_storage\_account\_key) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `string` | n/a | yes |
| <a name="input_tenant_client_id"></a> [tenant\_client\_id](#input\_tenant\_client\_id) | The client\_id of the platform's service principal | `string` | n/a | yes |
| <a name="input_tenant_client_secret"></a> [tenant\_client\_secret](#input\_tenant\_client\_secret) | The client\_secret of the platform's service principal | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id | `string` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `any` | n/a | yes |
| <a name="input_tls_secret_name"></a> [tls\_secret\_name](#input\_tls\_secret\_name) | n/a | `string` | n/a | yes |
| <a name="input_api_replicas"></a> [api\_replicas](#input\_api\_replicas) | n/a | `number` | `1` | no |
| <a name="input_archive_ttl"></a> [archive\_ttl](#input\_archive\_ttl) | n/a | `string` | `"3d"` | no |
| <a name="input_argo_minio_persistence_size"></a> [argo\_minio\_persistence\_size](#input\_argo\_minio\_persistence\_size) | n/a | `string` | `"16Gi"` | no |
| <a name="input_argo_minio_requests_memory"></a> [argo\_minio\_requests\_memory](#input\_argo\_minio\_requests\_memory) | n/a | `string` | `"2Gi"` | no |
| <a name="input_chart_grafana_loki_version"></a> [chart\_grafana\_loki\_version](#input\_chart\_grafana\_loki\_version) | Grafana-loki chart version | `string` | `"4.6.23"` | no |
| <a name="input_chart_redis_version"></a> [chart\_redis\_version](#input\_chart\_redis\_version) | n/a | `string` | `"17.8.0"` | no |
| <a name="input_cosmos_key"></a> [cosmos\_key](#input\_cosmos\_key) | n/a | `string` | `""` | no |
| <a name="input_cosmos_uri"></a> [cosmos\_uri](#input\_cosmos\_uri) | n/a | `string` | `""` | no |
| <a name="input_cosmotech_api_ingress_enabled"></a> [cosmotech\_api\_ingress\_enabled](#input\_cosmotech\_api\_ingress\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cosmotech_api_persistence_size"></a> [cosmotech\_api\_persistence\_size](#input\_cosmotech\_api\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_cosmotech_api_persistence_storage_class"></a> [cosmotech\_api\_persistence\_storage\_class](#input\_cosmotech\_api\_persistence\_storage\_class) | n/a | `string` | `""` | no |
| <a name="input_create_keycloak"></a> [create\_keycloak](#input\_create\_keycloak) | Wether to create Keycloak resources fot this tenant :<br>- realm<br>- OpenID client & scopes<br>- roles<br>- Authentication flow<br>- Default user<br>After this deployment, you will need to manually set the authentication flow<br> as the default to the broker identification. To do so go to the Authentication menu.<br> On the new line with the "auto link user" flow, click the 3 dot at the end of the line<br>  and then "Bind flow". Then select **First broker login flow**.<br> You should have the newly created flow "auto link user" with the column Used by set to<br>  First broker login flow. | `bool` | `true` | no |
| <a name="input_create_rabbitmq"></a> [create\_rabbitmq](#input\_create\_rabbitmq) | Whether to create RabbitMQ resources | `bool` | `true` | no |
| <a name="input_grafana_loki_bucket_name"></a> [grafana\_loki\_bucket\_name](#input\_grafana\_loki\_bucket\_name) | n/a | `string` | `"grafana-loki"` | no |
| <a name="input_list_apikey_allowed"></a> [list\_apikey\_allowed](#input\_list\_apikey\_allowed) | n/a | <pre>list(object({<br>    name           = string<br>    apiKey         = string<br>    associatedRole = string<br>    securedUris    = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "apiKey": "",<br>    "associatedRole": "",<br>    "name": "",<br>    "securedUris": []<br>  }<br>]</pre> | no |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_postgresql_persistence_size"></a> [postgresql\_persistence\_size](#input\_postgresql\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_rabbitmq_persistence_size"></a> [rabbitmq\_persistence\_size](#input\_rabbitmq\_persistence\_size) | n/a | `string` | `"8Gi"` | no |
| <a name="input_redis_persistence_size"></a> [redis\_persistence\_size](#input\_redis\_persistence\_size) | n/a | `string` | `"64Gi"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | `6379` | no |
| <a name="input_seaweedfs_chart_version"></a> [seaweedfs\_chart\_version](#input\_seaweedfs\_chart\_version) | SeaweedFS chart version | `string` | `"3.0.4"` | no |
| <a name="input_tls_certificate_custom_certificate"></a> [tls\_certificate\_custom\_certificate](#input\_tls\_certificate\_custom\_certificate) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_custom_key"></a> [tls\_certificate\_custom\_key](#input\_tls\_certificate\_custom\_key) | n/a | `string` | `""` | no |
<!-- END_TF_DOCS -->