output "mssql_server_id" {
  value       = azurerm_mssql_server.mssql_server.id
  description = "MySQL server ID"
}

output "mssql_server_fqdn" {
  value       = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
  description = "MySQL server FQDN"
}

output "mssql_database_id" {
  value       = one([for v in azurerm_mssql_database.mssql : v.id])
  description = "The ID of the MySQL Database."
}
