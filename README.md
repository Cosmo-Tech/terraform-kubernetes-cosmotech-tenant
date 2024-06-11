<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.48.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.54.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 2.0.4 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.54.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-tenant-prerequisites"></a> [azure-tenant-prerequisites](#module\_azure-tenant-prerequisites) | ./azure-tenant-prerequisites | n/a |
| <a name="module_azure-tenant-resources"></a> [azure-tenant-resources](#module\_azure-tenant-resources) | ./azure-tenant-resources | n/a |
| <a name="module_create-vault-entries"></a> [create-vault-entries](#module\_create-vault-entries) | ./create-vault-entries | n/a |
| <a name="module_platform-tenant-resources"></a> [platform-tenant-resources](#module\_platform-tenant-resources) | ./platform-tenant-resources | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.tenant_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_kubernetes_cluster.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |
| [azurerm_public_ip.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/public_ip) | data source |
| [azurerm_resource_group.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.tenant_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_dns_name"></a> [api\_dns\_name](#input\_api\_dns\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | n/a | yes |
| <a name="input_common_platform_object_id"></a> [common\_platform\_object\_id](#input\_common\_platform\_object\_id) | n/a | `string` | n/a | yes |
| <a name="input_common_resource_group"></a> [common\_resource\_group](#input\_common\_resource\_group) | Existing Resource group which contain common platform resources | `string` | n/a | yes |
| <a name="input_cosmotech_api_version"></a> [cosmotech\_api\_version](#input\_cosmotech\_api\_version) | n/a | `string` | n/a | yes |
| <a name="input_dns_record"></a> [dns\_record](#input\_dns\_record) | The DNS zone name to create platform subdomain. Example: myplatform | `string` | n/a | yes |
| <a name="input_kubernetes_azurefile_storage_class_sku"></a> [kubernetes\_azurefile\_storage\_class\_sku](#input\_kubernetes\_azurefile\_storage\_class\_sku) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_azurefile_storage_tags"></a> [kubernetes\_azurefile\_storage\_tags](#input\_kubernetes\_azurefile\_storage\_tags) | n/a | `string` | n/a | yes |
| <a name="input_kubernetes_tenant_namespace"></a> [kubernetes\_tenant\_namespace](#input\_kubernetes\_tenant\_namespace) | The kubernetes namespace to create | `string` | n/a | yes |
| <a name="input_network_client_id"></a> [network\_client\_id](#input\_network\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_owner_list"></a> [owner\_list](#input\_owner\_list) | List of mail addresses for App Registration owners | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name | `any` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | The public IP resource of the platform | `string` | n/a | yes |
| <a name="input_publicip_resource_group"></a> [publicip\_resource\_group](#input\_publicip\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The subscription id | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The tenant id | `any` | n/a | yes |
| <a name="input_tenant_resource_group"></a> [tenant\_resource\_group](#input\_tenant\_resource\_group) | Resource group to create which will contain created Azure resources for this tenant | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The virtual network of the platform common resources | `string` | n/a | yes |
| <a name="input_vnet_resource_group"></a> [vnet\_resource\_group](#input\_vnet\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_adt_privatedns_zonename"></a> [adt\_privatedns\_zonename](#input\_adt\_privatedns\_zonename) | n/a | `string` | `"privatelink.digitaltwins.azure.net"` | no |
| <a name="input_api_replicas"></a> [api\_replicas](#input\_api\_replicas) | n/a | `number` | `2` | no |
| <a name="input_api_version_path"></a> [api\_version\_path](#input\_api\_version\_path) | The API version path | `string` | `"v3-1"` | no |
| <a name="input_archive_ttl"></a> [archive\_ttl](#input\_archive\_ttl) | n/a | `string` | `"3d"` | no |
| <a name="input_argo_minio_persistence_size"></a> [argo\_minio\_persistence\_size](#input\_argo\_minio\_persistence\_size) | n/a | `string` | `"16Gi"` | no |
| <a name="input_argo_minio_requests_memory"></a> [argo\_minio\_requests\_memory](#input\_argo\_minio\_requests\_memory) | n/a | `string` | `"2Gi"` | no |
| <a name="input_audience"></a> [audience](#input\_audience) | The App Registration audience type | `string` | `"AzureADMultipleOrgs"` | no |
| <a name="input_auto_stop_kusto"></a> [auto\_stop\_kusto](#input\_auto\_stop\_kusto) | Specifies if the cluster could be automatically stopped | `bool` | `true` | no |
| <a name="input_babylon_client_id"></a> [babylon\_client\_id](#input\_babylon\_client\_id) | n/a | `string` | `""` | no |
| <a name="input_babylon_client_secret"></a> [babylon\_client\_secret](#input\_babylon\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_babylon_sp_object_id"></a> [babylon\_sp\_object\_id](#input\_babylon\_sp\_object\_id) | n/a | `string` | `""` | no |
| <a name="input_blob_privatedns_zonename"></a> [blob\_privatedns\_zonename](#input\_blob\_privatedns\_zonename) | n/a | `string` | `"privatelink.blob.core.windows.net"` | no |
| <a name="input_chart_package_version"></a> [chart\_package\_version](#input\_chart\_package\_version) | The version of the Cosmo Tech API chart to deploy | `string` | `"3.1.2"` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client id | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret | `string` | `""` | no |
| <a name="input_cluster_issuer_name"></a> [cluster\_issuer\_name](#input\_cluster\_issuer\_name) | n/a | `string` | `"letsencrypt-prod"` | no |
| <a name="input_cosmotech_api_ingress_enabled"></a> [cosmotech\_api\_ingress\_enabled](#input\_cosmotech\_api\_ingress\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | The value associated to a resource (tag) | `string` | `"NA"` | no |
| <a name="input_create_adx"></a> [create\_adx](#input\_create\_adx) | Whether to create Azure digital explorer | `bool` | `true` | no |
| <a name="input_create_babylon"></a> [create\_babylon](#input\_create\_babylon) | Create the Azure Active Directory Application for Babylon | `bool` | `true` | no |
| <a name="input_create_backup"></a> [create\_backup](#input\_create\_backup) | Whether to create Azure backup vault along with the managed disk | `bool` | `false` | no |
| <a name="input_create_cosmosdb"></a> [create\_cosmosdb](#input\_create\_cosmosdb) | Whether to create CosmosDB (only for API version < 2.4) | `bool` | `false` | no |
| <a name="input_create_dnsrecord"></a> [create\_dnsrecord](#input\_create\_dnsrecord) | Create the DNS record | `bool` | `false` | no |
| <a name="input_create_eventhub"></a> [create\_eventhub](#input\_create\_eventhub) | Whether to create Azure Event Hub resources | `bool` | `true` | no |
| <a name="input_create_powerbi"></a> [create\_powerbi](#input\_create\_powerbi) | Create the Azure Active Directory Application for PowerBI | `bool` | `false` | no |
| <a name="input_create_publicip"></a> [create\_publicip](#input\_create\_publicip) | Create the public IP for the platform | `bool` | `false` | no |
| <a name="input_create_rabbitmq"></a> [create\_rabbitmq](#input\_create\_rabbitmq) | Whether to create RabbitMQ resources | `bool` | `false` | no |
| <a name="input_create_restish"></a> [create\_restish](#input\_create\_restish) | Create the Azure Active Directory Application for Restish | `bool` | `false` | no |
| <a name="input_create_secrets"></a> [create\_secrets](#input\_create\_secrets) | Create secrets for newly created app registrations | `bool` | `true` | no |
| <a name="input_create_vault_entries"></a> [create\_vault\_entries](#input\_create\_vault\_entries) | Custom module used to automatically retrieve Cosmo Tech Platform values and fill Vault in order to be used by Babylon | `bool` | `false` | no |
| <a name="input_create_webapp"></a> [create\_webapp](#input\_create\_webapp) | Create the Azure Active Directory Application for WebApp | `bool` | `false` | no |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | The customer name | `string` | `"cosmotech"` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | Represents the kind of deployment. Currently two modes: ARM or Terraform | `string` | `"Terraform"` | no |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | The DNS zone name to create platform subdomain. Example: api.cosmotech.com | `string` | `"api.cosmotech.com"` | no |
| <a name="input_dns_zone_rg"></a> [dns\_zone\_rg](#input\_dns\_zone\_rg) | The DNS zone resource group | `string` | `"phoenix"` | no |
| <a name="input_eventhub_privatedns_zonename"></a> [eventhub\_privatedns\_zonename](#input\_eventhub\_privatedns\_zonename) | n/a | `string` | `"privatelink.servicebus.windows.net"` | no |
| <a name="input_identifier_uri"></a> [identifier\_uri](#input\_identifier\_uri) | The platform identifier uri | `string` | `""` | no |
| <a name="input_image_path"></a> [image\_path](#input\_image\_path) | n/a | `string` | `"./cosmotech.png"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Azure Kubernetes Service version | `string` | `"1.26.6"` | no |
| <a name="input_kusto_instance_type"></a> [kusto\_instance\_type](#input\_kusto\_instance\_type) | n/a | `string` | `"Standard_D12_v2"` | no |
| <a name="input_kusto_privatedns_zonename"></a> [kusto\_privatedns\_zonename](#input\_kusto\_privatedns\_zonename) | n/a | `string` | `"privatelink.kusto.core.windows.net"` | no |
| <a name="input_kustonr_instances"></a> [kustonr\_instances](#input\_kustonr\_instances) | n/a | `number` | `2` | no |
| <a name="input_list_apikey_allowed"></a> [list\_apikey\_allowed](#input\_list\_apikey\_allowed) | n/a | <pre>list(object({<br>    name           = string<br>    apiKey         = string<br>    associatedRole = string<br>    securedUris    = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "apiKey": "",<br>    "associatedRole": "",<br>    "name": "",<br>    "securedUris": []<br>  }<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location | `string` | `"West Europe"` | no |
| <a name="input_managed_disk_name"></a> [managed\_disk\_name](#input\_managed\_disk\_name) | Name of the managed disk to create | `string` | `""` | no |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | n/a | `string` | `"true"` | no |
| <a name="input_monitoring_namespace"></a> [monitoring\_namespace](#input\_monitoring\_namespace) | n/a | `string` | `"cosmotech-monitoring"` | no |
| <a name="input_network_client_secret"></a> [network\_client\_secret](#input\_network\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_network_sp_object_id"></a> [network\_sp\_object\_id](#input\_network\_sp\_object\_id) | The object id of the network service principal | `string` | `""` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | n/a | `string` | `""` | no |
| <a name="input_platform_name"></a> [platform\_name](#input\_platform\_name) | The platform id for babylon v4 | `string` | `""` | no |
| <a name="input_platform_url"></a> [platform\_url](#input\_platform\_url) | The platform url | `string` | `""` | no |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | The platform stage | `string` | `"Dev"` | no |
| <a name="input_queue_privatedns_zonename"></a> [queue\_privatedns\_zonename](#input\_queue\_privatedns\_zonename) | n/a | `string` | `"privatelink.queue.core.windows.net"` | no |
| <a name="input_redis_disk_name"></a> [redis\_disk\_name](#input\_redis\_disk\_name) | n/a | `string` | `"cosmotech-database-disk"` | no |
| <a name="input_redis_disk_size_gb"></a> [redis\_disk\_size\_gb](#input\_redis\_disk\_size\_gb) | The size of the managed disk to create (Gb) | `string` | `64` | no |
| <a name="input_redis_disk_sku"></a> [redis\_disk\_sku](#input\_redis\_disk\_sku) | The SKU of the managed disk | `string` | `"Premium_LRS"` | no |
| <a name="input_redis_disk_tier"></a> [redis\_disk\_tier](#input\_redis\_disk\_tier) | The tier of the managed disk | `string` | `"P6"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | n/a | `number` | `6379` | no |
| <a name="input_storage_kind"></a> [storage\_kind](#input\_storage\_kind) | n/a | `string` | `"StorageV2"` | no |
| <a name="input_table_privatedns_zonename"></a> [table\_privatedns\_zonename](#input\_table\_privatedns\_zonename) | n/a | `string` | `"privatelink.table.core.windows.net"` | no |
| <a name="input_tenant_client_id"></a> [tenant\_client\_id](#input\_tenant\_client\_id) | n/a | `string` | `""` | no |
| <a name="input_tenant_client_secret"></a> [tenant\_client\_secret](#input\_tenant\_client\_secret) | n/a | `string` | `""` | no |
| <a name="input_tenant_group_id"></a> [tenant\_group\_id](#input\_tenant\_group\_id) | The object id of the platform group | `string` | `""` | no |
| <a name="input_tenant_sp_name"></a> [tenant\_sp\_name](#input\_tenant\_sp\_name) | The name of the platform on which we deploy the tenant | `string` | `""` | no |
| <a name="input_tenant_sp_object_id"></a> [tenant\_sp\_object\_id](#input\_tenant\_sp\_object\_id) | The object id of the platform service principal | `string` | `""` | no |
| <a name="input_tenant_virtual_network_address_prefix"></a> [tenant\_virtual\_network\_address\_prefix](#input\_tenant\_virtual\_network\_address\_prefix) | The Virtual Network IP range. Minimum /26 NetMaskLength | `string` | `"10.40.0.0/16"` | no |
| <a name="input_tenant_virtual_subnet_network_address_prefix"></a> [tenant\_virtual\_subnet\_network\_address\_prefix](#input\_tenant\_virtual\_subnet\_network\_address\_prefix) | n/a | `string` | `"10.40.0.0/24"` | no |
| <a name="input_tf_access_key"></a> [tf\_access\_key](#input\_tf\_access\_key) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_access\_key="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_blob_name_tenant"></a> [tf\_blob\_name\_tenant](#input\_tf\_blob\_name\_tenant) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_blob\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_container_name"></a> [tf\_container\_name](#input\_tf\_container\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_container\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_resource_group_name"></a> [tf\_resource\_group\_name](#input\_tf\_resource\_group\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_resource\_group\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tf_storage_account_name"></a> [tf\_storage\_account\_name](#input\_tf\_storage\_account\_name) | Variable to be used with backend remote option :<br>First set necessary vars:<br>- export TF\_VAR\_tf\_storage\_account\_name="some\_value"<br>Then call terraform init:<br>terraform init \<br>    -backend-config "resource\_group\_name=$TF\_VAR\_tf\_resource\_group\_name" \<br>    -backend-config "storage\_account\_name=$TF\_VAR\_tf\_storage\_account\_name" \<br>    -backend-config "container\_name=$TF\_VAR\_tf\_container\_name" \<br>    -backend-config "key=$TF\_VAR\_tf\_blob\_name" \<br>    -backend-config "access\_key=$TF\_VAR\_tf\_access\_key" | `string` | `""` | no |
| <a name="input_tls_certificate_custom_certificate"></a> [tls\_certificate\_custom\_certificate](#input\_tls\_certificate\_custom\_certificate) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_custom_key"></a> [tls\_certificate\_custom\_key](#input\_tls\_certificate\_custom\_key) | n/a | `string` | `""` | no |
| <a name="input_tls_certificate_type"></a> [tls\_certificate\_type](#input\_tls\_certificate\_type) | n/a | `string` | `"let_s_encrypt"` | no |
| <a name="input_user_app_role"></a> [user\_app\_role](#input\_user\_app\_role) | App role for azuread\_application | <pre>list(object({<br>    description  = string<br>    display_name = string<br>    id           = string<br>    role_value   = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Workspace Writer",<br>    "display_name": "Workspace Writer",<br>    "id": "3f7ba86c-9940-43c8-a54d-0bfb706da136",<br>    "role_value": "Workspace.Writer"<br>  },<br>  {<br>    "description": "Workspace Reader",<br>    "display_name": "Workspace Reader",<br>    "id": "73ce2073-d918-4fe1-bc24-a4e69db07db8",<br>    "role_value": "Workspace.Reader"<br>  },<br>  {<br>    "description": "Solution Writer",<br>    "display_name": "Solution Writer",<br>    "id": "4f6e62a3-7f0a-4396-9620-ab465cd6577b",<br>    "role_value": "Solution.Writer"<br>  },<br>  {<br>    "description": "Solution Reader",<br>    "display_name": "Solution Reader",<br>    "id": "cf1a8625-38d9-417b-a5b9-a27c0014e740",<br>    "role_value": "Solution.Reader"<br>  },<br>  {<br>    "description": "ScenarioRun Writer",<br>    "display_name": "ScenarioRun Writer",<br>    "id": "ca8a2a19-3e09-48cc-976b-85ec9de4f68a",<br>    "role_value": "ScenarioRun.Writer"<br>  },<br>  {<br>    "description": "ScenarioRun Reader",<br>    "display_name": "ScenarioRun Reader",<br>    "id": "bdc8fe2a-73a8-477d-9efa-d8a37a4eb0f7",<br>    "role_value": "ScenarioRun.Reader"<br>  },<br>  {<br>    "description": "Scenario Writer",<br>    "display_name": "Scenario Writer",<br>    "id": "8fb9d03e-c46d-4003-a2a6-34d8b506e4e7",<br>    "role_value": "Scenario.Writer"<br>  },<br>  {<br>    "description": "Scenario Reader",<br>    "display_name": "Scenario Reader",<br>    "id": "e07dab65-4200-4502-8e36-79ca687320d9",<br>    "role_value": "Scenario.Reader"<br>  },<br>  {<br>    "description": "Organization Writer",<br>    "display_name": "Organization Writer",<br>    "id": "89d74995-095c-442f-bfda-06a77d3dbaa4",<br>    "role_value": "Organization.Writer"<br>  },<br>  {<br>    "description": "Organization Reader",<br>    "display_name": "Organization Reader",<br>    "id": "96213509-202a-497c-9f60-53c5f85268ec",<br>    "role_value": "Organization.Reader"<br>  },<br>  {<br>    "description": "Dataset Writer",<br>    "display_name": "Dataset Writer",<br>    "id": "c6e5d483-ec2c-4710-bf0c-78b0fda611dc",<br>    "role_value": "Dataset.Writer"<br>  },<br>  {<br>    "description": "Dataset Reader",<br>    "display_name": "Dataset Reader",<br>    "id": "454dc3f5-3012-45b3-bad6-975dae94338c",<br>    "role_value": "Dataset.Reader"<br>  },<br>  {<br>    "description": "Ability to write connectors",<br>    "display_name": "Connector Writer",<br>    "id": "e150953f-4835-4502-b95e-81d9ce97f591",<br>    "role_value": "Connector.Writer"<br>  },<br>  {<br>    "description": "Organization Viewer",<br>    "display_name": "Organization Viewer",<br>    "id": "ec5fdd3c-4df0-4c2f-bdad-0495a49f6e90",<br>    "role_value": "Organization.Viewer"<br>  },<br>  {<br>    "description": "Organization User",<br>    "display_name": "Organization User",<br>    "id": "bb9ffb73-997e-4320-8625-cfe45469aa3c",<br>    "role_value": "Organization.User"<br>  },<br>  {<br>    "description": "Organization Modeler",<br>    "display_name": "Organization Modeler",<br>    "id": "adcdb0a1-1588-4d2b-8657-364e544ac7e1",<br>    "role_value": "Organization.Modeler"<br>  },<br>  {<br>    "description": "Organization Administrator",<br>    "display_name": "Organization Admin",<br>    "id": "04b96a76-d77e-4a9d-967f-c55c857c478c",<br>    "role_value": "Organization.Admin"<br>  },<br>  {<br>    "description": "Organization Collaborator",<br>    "display_name": "Organization Collaborator",<br>    "id": "6f5ec4e3-1f2d-4502-837e-5d9754ea8acb",<br>    "role_value": "Organization.Collaborator"<br>  },<br>  {<br>    "description": "Ability to develop connectors",<br>    "display_name": "Connector Developer",<br>    "id": "428ab58e-ab61-4621-907c-d7908be72df7",<br>    "role_value": "Connector.Developer"<br>  },<br>  {<br>    "description": "Ability to read connectors",<br>    "display_name": "Connector Reader",<br>    "id": "2cd74037-3ccd-4ab7-929d-4afce87be2e4",<br>    "role_value": "Connector.Reader"<br>  },<br>  {<br>    "description": "Platform Administrator",<br>    "display_name": "Platform Admin",<br>    "id": "bb49d61f-8b6a-4a19-b5bd-06a29d6b8e60",<br>    "role_value": "Platform.Admin"<br>  }<br>]</pre> | no |
| <a name="input_vault_addr"></a> [vault\_addr](#input\_vault\_addr) | The address of the Vault to save current platform configuration values | `string` | `""` | no |
| <a name="input_vault_token"></a> [vault\_token](#input\_vault\_token) | The token of the Vault to save current platform configuration values | `string` | `""` | no |
| <a name="input_webapp_url"></a> [webapp\_url](#input\_webapp\_url) | The Web Application URL | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_out_acr_login_server"></a> [out\_acr\_login\_server](#output\_out\_acr\_login\_server) | n/a |
| <a name="output_out_adx_uri"></a> [out\_adx\_uri](#output\_out\_adx\_uri) | n/a |
| <a name="output_out_babylon_client_id"></a> [out\_babylon\_client\_id](#output\_out\_babylon\_client\_id) | n/a |
| <a name="output_out_babylon_client_secret"></a> [out\_babylon\_client\_secret](#output\_out\_babylon\_client\_secret) | n/a |
| <a name="output_out_babylon_principal_id"></a> [out\_babylon\_principal\_id](#output\_out\_babylon\_principal\_id) | n/a |
| <a name="output_out_cluster_adx_name"></a> [out\_cluster\_adx\_name](#output\_out\_cluster\_adx\_name) | n/a |
| <a name="output_out_cluster_adx_principal_id"></a> [out\_cluster\_adx\_principal\_id](#output\_out\_cluster\_adx\_principal\_id) | n/a |
| <a name="output_out_cosmos_api_scope"></a> [out\_cosmos\_api\_scope](#output\_out\_cosmos\_api\_scope) | n/a |
| <a name="output_out_cosmos_api_url"></a> [out\_cosmos\_api\_url](#output\_out\_cosmos\_api\_url) | n/a |
| <a name="output_out_cosmos_api_version_path"></a> [out\_cosmos\_api\_version\_path](#output\_out\_cosmos\_api\_version\_path) | n/a |
| <a name="output_out_resource_location"></a> [out\_resource\_location](#output\_out\_resource\_location) | n/a |
| <a name="output_out_storage_account_name"></a> [out\_storage\_account\_name](#output\_out\_storage\_account\_name) | n/a |
| <a name="output_out_storage_account_secret"></a> [out\_storage\_account\_secret](#output\_out\_storage\_account\_secret) | n/a |
| <a name="output_out_subscription_id"></a> [out\_subscription\_id](#output\_out\_subscription\_id) | n/a |
| <a name="output_out_tenant_resource_group_name"></a> [out\_tenant\_resource\_group\_name](#output\_out\_tenant\_resource\_group\_name) | n/a |
| <a name="output_out_tenant_sp_client_id"></a> [out\_tenant\_sp\_client\_id](#output\_out\_tenant\_sp\_client\_id) | n/a |
| <a name="output_out_tenant_sp_object_id"></a> [out\_tenant\_sp\_object\_id](#output\_out\_tenant\_sp\_object\_id) | n/a |
<!-- END_TF_DOCS -->