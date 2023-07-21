# Azure SQL Server + Database Terraform Module

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_server.mssql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | he administrator passowrd for the new server. | `string` | n/a | yes |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | Azure AD Administrator Credentials | <pre>object({<br>    login_username              = string<br>    object_id                   = string<br>    tenant_id                   = string<br>    azuread_authentication_only = bool<br>  })</pre> | n/a | yes |
| <a name="input_connection_policy"></a> [connection\_policy](#input\_connection\_policy) | The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default. | `string` | n/a | yes |
| <a name="input_db_version"></a> [db\_version](#input\_db\_version) | The version for the new server. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default. | `string` | n/a | yes |
| <a name="input_mysql_database_map"></a> [mysql\_database\_map](#input\_mysql\_database\_map) | Manages a MySQL Server and Database specifications | <pre>map(object({<br>    collation                           = optional(string)<br>    maintenance_configuration_name      = optional(string)<br>    ledger_enabled                      = optional(bool)<br>    license_type                        = optional(string)<br>    max_size_gb                         = optional(number)<br>    read_replica_count                  = optional(number)<br>    read_scale                          = optional(bool)<br>    sku_name                            = optional(string)<br>    storage_account_type                = optional(string)<br>    zone_redundant                      = optional(bool)<br>    transparent_data_encryption_enabled = optional(bool)<br>    threat_detection_policy = optional(object({<br>      state                      = optional(string)<br>      disabled_alerts            = optional(list(string))<br>      email_account_admins       = optional(string)<br>      email_addresses            = optional(list(string))<br>      retention_days             = optional(string)<br>      storage_account_access_key = optional(string)<br>      storage_endpoint           = optional(string)<br>    }))<br>    short_term_retention_policy = optional(object({<br>      retention_days           = optional(number)<br>      backup_interval_in_hours = optional(number)<br>    }))<br>    long_term_retention_policy = optional(object({<br>      weekly_retention  = optional(string)<br>      monthly_retention = optional(string)<br>      yearly_retention  = optional(string)<br>      week_of_year      = optional(string)<br>    }))<br>    tags = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_mysql_server_name"></a> [mysql\_server\_name](#input\_mysql\_server\_name) | The name of the Microsoft SQL Server. | `string` | n/a | yes |
| <a name="input_outbound_network_restriction_enabled"></a> [outbound\_network\_restriction\_enabled](#input\_outbound\_network\_restriction\_enabled) | Whether outbound network traffic is restricted for this server. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this server. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Microsoft SQL Server. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_database_id"></a> [mssql\_database\_id](#output\_mssql\_database\_id) | The ID of the MySQL Database. |
| <a name="output_mssql_server_fqdn"></a> [mssql\_server\_fqdn](#output\_mssql\_server\_fqdn) | MySQL server FQDN |
| <a name="output_mssql_server_id"></a> [mssql\_server\_id](#output\_mssql\_server\_id) | MySQL server ID |
<!-- END_TF_DOCS -->