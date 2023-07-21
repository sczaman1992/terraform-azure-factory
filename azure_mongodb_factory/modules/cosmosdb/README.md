<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.cosmosdb_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [random_integer.intg](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to enable for this Cosmos DB account. Possible values are AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableMongo16MBDocumentSupport, EnableMongoRetryableWrites, EnableMongoRoleBasedAccessControl, EnablePartialUniqueIndex, EnableServerless, EnableTable, EnableTtlOnCustomPath, EnableUniqueCompoundNestedDocs, MongoDBv3.4 and mongoEnableDocLevelTTL. | <pre>object({<br>    name = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_cosmos_db_name"></a> [cosmos\_db\_name](#input\_cosmos\_db\_name) | Specifies the name of the CosmosDB Account. | `string` | n/a | yes |
| <a name="input_cosmosdb_account"></a> [cosmosdb\_account](#input\_cosmosdb\_account) | Manages a CosmosDB (formally DocumentDB) Account specifications | <pre>map(object({<br>    offer_type = string<br>    capacity = object({<br>      total_throughput_limit = optional(number)<br>    })<br>    mongo_server_version       = optional(string)<br>    enable_free_tier           = optional(bool)<br>    analytical_storage_enabled = optional(bool)<br>    analytical_storage = optional(object({<br>      schema_type = optional(string)<br>    }))<br>    enable_automatic_failover             = optional(bool)<br>    public_network_access_enabled         = optional(bool)<br>    is_virtual_network_filter_enabled     = optional(bool)<br>    key_vault_identity                    = optional(string)<br>    key_vault_key_id                      = optional(string)<br>    enable_multiple_write_locations       = optional(bool)<br>    access_key_metadata_writes_enabled    = optional(bool)<br>    local_authentication_disabled         = optional(bool)<br>    network_acl_bypass_for_azure_services = optional(bool)<br>    network_acl_bypass_ids                = optional(list(string), [])<br>    allowed_ip_range_cidrs                = optional(list(string))<br>    consistency_policy = object({<br>      consistency_level       = string<br>      max_interval_in_seconds = optional(number)<br>      max_staleness_prefix    = optional(number)<br>    })<br>    backup = optional(object({<br>      type                = optional(string)<br>      interval_in_minutes = optional(number)<br>      retention_in_hours  = optional(number)<br>    }))<br>    identity = optional(object({<br>      type                       = string<br>      user_assigned_identity_ids = optional(list(string), [])<br>    }))<br>    cors_rule = optional(object({<br>      allowed_headers    = optional(list(string), [])<br>      allowed_methods    = optional(list(string), [])<br>      allowed_origins    = optional(list(string), [])<br>      exposed_headers    = optional(list(string), [])<br>      max_age_in_seconds = optional(number)<br>    }))<br>    tags = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_failover_locations"></a> [failover\_locations](#input\_failover\_locations) | The name of the Azure region to host replicated data and their priority. | <pre>list(object({<br>    location          = string<br>    failover_priority = number<br>    zone_redundant    = optional(bool)<br>  }))</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | n/a | yes |
| <a name="input_virtual_network_rules"></a> [virtual\_network\_rules](#input\_virtual\_network\_rules) | Configures the virtual network subnets allowed to access this Cosmos DB account | <pre>list(object({<br>    id                                   = optional(string)<br>    ignore_missing_vnet_service_endpoint = optional(bool)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_id"></a> [cosmosdb\_id](#output\_cosmosdb\_id) | Cosmosdb account ID |
| <a name="output_cosmosdb_name"></a> [cosmosdb\_name](#output\_cosmosdb\_name) | Cosmosdb account Name |
<!-- END_TF_DOCS -->