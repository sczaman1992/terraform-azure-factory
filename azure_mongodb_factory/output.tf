output "cosmosdb_factory" {
  value       = module.cosmosdb
  description = "Full details of the CosmosDB account"
}

output "mongodb_factory" {
  value       = module.mongodb
  description = "Full details of the Mongodb Database"
}