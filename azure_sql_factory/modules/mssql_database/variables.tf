variable "mysql_server_name" {
  description = "The name of the Microsoft SQL Server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "db_version" {
  description = "The version for the new server."
  type        = string
}

variable "administrator_login" {
  description = "The administrator login name for the new server."
  type        = string
}

variable "administrator_login_password" {
  description = "he administrator passowrd for the new server."
  type        = string
}

variable "azuread_administrator" {
  type = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = bool
  })
  description = "Azure AD Administrator Credentials"
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
}

variable "minimum_tls_version" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this server."
  type        = string
}

variable "outbound_network_restriction_enabled" {
  description = "Whether outbound network traffic is restricted for this server."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "mysql_database_map" {
  type = map(object({
    collation                           = optional(string)
    maintenance_configuration_name      = optional(string)
    ledger_enabled                      = optional(bool)
    license_type                        = optional(string)
    max_size_gb                         = optional(number)
    read_replica_count                  = optional(number)
    read_scale                          = optional(bool)
    sku_name                            = optional(string)
    storage_account_type                = optional(string)
    zone_redundant                      = optional(bool)
    transparent_data_encryption_enabled = optional(bool)
    threat_detection_policy = optional(object({
      state                      = optional(string)
      disabled_alerts            = optional(list(string))
      email_account_admins       = optional(string)
      email_addresses            = optional(list(string))
      retention_days             = optional(string)
      storage_account_access_key = optional(string)
      storage_endpoint           = optional(string)
    }))
    short_term_retention_policy = optional(object({
      retention_days           = optional(number)
      backup_interval_in_hours = optional(number)
    }))
    long_term_retention_policy = optional(object({
      weekly_retention  = optional(string)
      monthly_retention = optional(string)
      yearly_retention  = optional(string)
      week_of_year      = optional(string)
    }))
    tags = optional(map(string))
  }))
  description = "Manages a MySQL Server and Database specifications"
}
