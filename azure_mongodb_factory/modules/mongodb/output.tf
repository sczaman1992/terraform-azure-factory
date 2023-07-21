output "mongo_db" {
  value       = resource.azurerm_cosmosdb_mongo_database.mongo_db
  description = "Full Details of the AzureRm Mongodb resource"
}


