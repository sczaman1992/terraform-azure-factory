output "cosmosdb_id" {
  value       = one([for v in azurerm_cosmosdb_account.cosmosdb_account : v.id])
  description = "Cosmosdb account ID"
}

output "cosmosdb_name" {
  value       = local.cosmos_db_name
  description = "Cosmosdb account Name"
}

