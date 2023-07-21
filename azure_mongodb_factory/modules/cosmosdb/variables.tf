variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "cosmos_db_name" {
  description = "Specifies the name of the CosmosDB Account."
  type        = string
}


variable "cosmosdb_account" {
  type = map(object({
    offer_type = string
    capacity = object({
      total_throughput_limit = optional(number)
    })
    mongo_server_version       = optional(string)
    enable_free_tier           = optional(bool)
    analytical_storage_enabled = optional(bool)
    analytical_storage = optional(object({
      schema_type = optional(string)
    }))
    enable_automatic_failover             = optional(bool)
    public_network_access_enabled         = optional(bool)
    is_virtual_network_filter_enabled     = optional(bool)
    key_vault_identity                    = optional(string)
    key_vault_key_id                      = optional(string)
    enable_multiple_write_locations       = optional(bool)
    access_key_metadata_writes_enabled    = optional(bool)
    local_authentication_disabled         = optional(bool)
    network_acl_bypass_for_azure_services = optional(bool)
    network_acl_bypass_ids                = optional(list(string), [])
    allowed_ip_range_cidrs                = optional(list(string))
    consistency_policy = object({
      consistency_level       = string
      max_interval_in_seconds = optional(number)
      max_staleness_prefix    = optional(number)
    })
    backup = optional(object({
      type                = optional(string)
      interval_in_minutes = optional(number)
      retention_in_hours  = optional(number)
    }))
    identity = optional(object({
      type                       = string
      user_assigned_identity_ids = optional(list(string), [])
    }))
    cors_rule = optional(object({
      allowed_headers    = optional(list(string), [])
      allowed_methods    = optional(list(string), [])
      allowed_origins    = optional(list(string), [])
      exposed_headers    = optional(list(string), [])
      max_age_in_seconds = optional(number)
    }))
    tags = optional(map(string))
  }))
  description = "Manages a CosmosDB (formally DocumentDB) Account specifications"
}

variable "capabilities" {
  type = object({
    name = list(string)
  })
  description = "Configures the capabilities to enable for this Cosmos DB account. Possible values are AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableMongo16MBDocumentSupport, EnableMongoRetryableWrites, EnableMongoRoleBasedAccessControl, EnablePartialUniqueIndex, EnableServerless, EnableTable, EnableTtlOnCustomPath, EnableUniqueCompoundNestedDocs, MongoDBv3.4 and mongoEnableDocLevelTTL."
}

variable "failover_locations" {
  type = list(object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool)
  }))
  description = "The name of the Azure region to host replicated data and their priority."
  default     = null
}

variable "virtual_network_rules" {
  description = "Configures the virtual network subnets allowed to access this Cosmos DB account"
  type = list(object({
    id                                   = optional(string)
    ignore_missing_vnet_service_endpoint = optional(bool)
  }))
}
