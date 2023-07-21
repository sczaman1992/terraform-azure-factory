<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cosmosdb"></a> [cosmosdb](#module\_cosmosdb) | ./modules/cosmosdb | n/a |
| <a name="module_mongodb"></a> [mongodb](#module\_mongodb) | ./modules/mongodb | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cosmosdb_dir"></a> [cosmosdb\_dir](#input\_cosmosdb\_dir) | YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cosmosdb_factory"></a> [cosmosdb\_factory](#output\_cosmosdb\_factory) | Full details of the CosmosDB account |
| <a name="output_mongodb_factory"></a> [mongodb\_factory](#output\_mongodb\_factory) | Full details of the Mongodb Database |
<!-- END_TF_DOCS -->