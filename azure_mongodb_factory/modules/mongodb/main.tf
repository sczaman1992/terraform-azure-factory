resource "random_integer" "intg" {
  min = 1
  max = 50
}

resource "azurerm_cosmosdb_mongo_database" "mongo_db" {
  name                = try("${var.mongo_db_name}-${random_integer.intg.result}", null)
  resource_group_name = try(var.resource_group_name, null)
  account_name        = try(var.cosmosdb_account_name, null)
  autoscale_settings {
    max_throughput = try(var.max_throughput, null)
  }
}
