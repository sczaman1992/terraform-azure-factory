locals {
  cosmos_db_name = tostring("${var.cosmos_db_name}-${random_integer.intg.result}")
}

resource "random_integer" "intg" {
  min = 1
  max = 50
}

resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  for_each            = var.cosmosdb_account
  name                = local.cosmos_db_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = each.value.offer_type
  capacity {
    total_throughput_limit = each.value.capacity.total_throughput_limit
  }
  kind                                  = each.key
  mongo_server_version                  = each.value.mongo_server_version
  enable_free_tier                      = each.value.enable_free_tier
  analytical_storage_enabled            = each.value.analytical_storage_enabled
  enable_automatic_failover             = each.value.enable_automatic_failover
  public_network_access_enabled         = each.value.public_network_access_enabled
  is_virtual_network_filter_enabled     = each.value.is_virtual_network_filter_enabled
  default_identity_type                 = each.value.key_vault_identity
  key_vault_key_id                      = each.value.key_vault_key_id
  enable_multiple_write_locations       = each.value.enable_multiple_write_locations
  access_key_metadata_writes_enabled    = each.value.access_key_metadata_writes_enabled
  local_authentication_disabled         = each.value.local_authentication_disabled
  network_acl_bypass_for_azure_services = each.value.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = each.value.network_acl_bypass_ids
  ip_range_filter                       = join(",", each.value.allowed_ip_range_cidrs)
  analytical_storage {
    schema_type = each.value.analytical_storage.schema_type
  }

  consistency_policy {
    consistency_level       = each.value.consistency_policy.consistency_level
    max_interval_in_seconds = each.value.consistency_policy.max_interval_in_seconds
    max_staleness_prefix    = each.value.consistency_policy.max_staleness_prefix
  }

  backup {
    type                = each.value.backup.type
    interval_in_minutes = each.value.backup.interval_in_minutes
    retention_in_hours  = each.value.backup.retention_in_hours
  }

  identity {
    type         = each.value.identity.type
    identity_ids = each.value.identity.user_assigned_identity_ids
  }

  cors_rule {
    allowed_headers    = each.value.cors_rule.allowed_headers
    allowed_methods    = each.value.cors_rule.allowed_methods
    allowed_origins    = each.value.cors_rule.allowed_origins
    exposed_headers    = each.value.cors_rule.exposed_headers
    max_age_in_seconds = each.value.cors_rule.max_age_in_seconds
  }

  dynamic "capabilities" {
    for_each = toset(var.capabilities.name)
    content {
      name = capabilities.value
    }
  }

  dynamic "geo_location" {
    for_each = var.failover_locations
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = geo_location.value.zone_redundant
    }
  }

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rules != null ? toset(var.virtual_network_rules) : []
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }

  tags = each.value.tags
}
