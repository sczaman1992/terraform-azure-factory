resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mysql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.db_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  azuread_administrator {
    login_username              = var.azuread_administrator.login_username
    object_id                   = var.azuread_administrator.object_id
    tenant_id                   = var.azuread_administrator.tenant_id
    azuread_authentication_only = var.azuread_administrator.azuread_authentication_only
  }
  connection_policy                    = var.connection_policy
  minimum_tls_version                  = var.minimum_tls_version
  public_network_access_enabled        = var.public_network_access_enabled
  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
  tags                                 = var.tags
}

resource "azurerm_mssql_database" "mssql" {
  for_each                            = var.mysql_database_map
  name                                = each.key
  server_id                           = resource.azurerm_mssql_server.mssql_server.id
  collation                           = each.value.collation
  maintenance_configuration_name      = each.value.maintenance_configuration_name
  ledger_enabled                      = each.value.ledger_enabled
  license_type                        = each.value.license_type
  max_size_gb                         = each.value.max_size_gb
  read_replica_count                  = each.value.read_replica_count
  read_scale                          = each.value.read_scale
  sku_name                            = each.value.sku_name
  storage_account_type                = each.value.storage_account_type
  zone_redundant                      = each.value.zone_redundant
  transparent_data_encryption_enabled = each.value.transparent_data_encryption_enabled
  threat_detection_policy {
    state                      = each.value.threat_detection_policy.state
    disabled_alerts            = each.value.threat_detection_policy.disabled_alerts
    email_account_admins       = each.value.threat_detection_policy.email_account_admins
    email_addresses            = each.value.threat_detection_policy.email_addresses
    retention_days             = each.value.threat_detection_policy.retention_days
    storage_account_access_key = each.value.threat_detection_policy.storage_account_access_key
    storage_endpoint           = each.value.threat_detection_policy.storage_endpoint
  }
  short_term_retention_policy {
    retention_days           = each.value.short_term_retention_policy.retention_days
    backup_interval_in_hours = each.value.short_term_retention_policy.backup_interval_in_hours
  }
  long_term_retention_policy {
    weekly_retention  = each.value.long_term_retention_policy.weekly_retention
    monthly_retention = each.value.long_term_retention_policy.monthly_retention
    yearly_retention  = each.value.long_term_retention_policy.yearly_retention
    week_of_year      = each.value.long_term_retention_policy.week_of_year
  }
  tags = each.value.tags
}



