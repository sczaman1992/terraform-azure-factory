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
| [azurerm_cosmosdb_mongo_database.mongo_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database) | resource |
| [random_integer.intg](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Cosmosdb Account Name | `string` | n/a | yes |
| <a name="input_max_throughput"></a> [max\_throughput](#input\_max\_throughput) | The maximum throughput of the MongoDB database (RU/s). | `number` | n/a | yes |
| <a name="input_mongo_db_name"></a> [mongo\_db\_name](#input\_mongo\_db\_name) | Specifies the name of the MongoDB Database. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mongo_db"></a> [mongo\_db](#output\_mongo\_db) | Full Details of the AzureRm Mongodb resource |
<!-- END_TF_DOCS -->