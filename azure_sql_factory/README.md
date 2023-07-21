# Azure SQL Server + Database Terraform Factory Module

This module utilizes YAML configuration to create SQL Server + Database.

## Usage
There are multiple examples included in the [examples](./examples/) folder but simple usage is as follows:

```
mysql_db:
  mysql_server_name: "mssql-server-1"
  resource_group_name: "rg_1"
  location: "eastus"
  db_version: "12.0"
  administrator_login: "mssql_admin"
  administrator_login_password: "mssql_pass"
  azuread_administrator:
    login_username: "user1"
    object_id: "object_id UUID"
    tenant_id: "tenant_id UUID"
    azuread_authentication_only: 
  connection_policy: "Default"
  minimum_tls_version: "1.2"
  public_network_access_enabled: "true"
  outbound_network_restriction_enabled: "false"
  tags:
    dev: mysql_server

  mysql_database_map:
    sql-db-1: 
      collation: "SQL_Latin1_General_CP1_CI_AS"
      maintenance_configuration_name: 
      ledger_enabled: false
      license_type: "LicenseIncluded"
      max_size_gb: 4
      read_replica_count: "2"
      read_scale: true
      sku_name: "GP_S_Gen5_2"
      storage_account_type: "Zone"
      zone_redundant: true
      transparent_data_encryption_enabled: true
      threat_detection_policy:
        state: "Enabled"
        disabled_alerts:
          - "Sql_Injection"
          - "Sql_Injection_Vulnerability"
          - "Access_Anomaly"
        email_account_admin: "Enabled"
        email_addresses:
          - "admin@mysql.com"
          - "user@mysql.com"
        retention_day: "10"
        storage_account_access_key: "111-111-111-111"
        storage_endpoint: "https://example.blob.core.windows.net"
      short_term_retention_policy:
        retention_days: 7
        backup_interval_in_hours: 12
      long_term_retention_policy:
        weekly_retention: "P1W"
        monthly_retention: "P1M"
        yearly_retention: "P1Y"
        week_of_year: "1"
      tags:
        dev: mysql_db_1
```
## Where should I store my Terraform state?

Terraform state be stored on Google Cloud Storage or Terraform Cloud.

```hcl
terraform {
  cloud {
    organization = "tf-org"
    workspaces {
      name = "tf-workspace"
    }
  }
}

```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mysql_db"></a> [mysql\_db](#module\_mysql\_db) | ./modules/mssql_database | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mysql_dir"></a> [mysql\_dir](#input\_mysql\_dir) | YAML directory | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_db"></a> [mysql\_db](#output\_mysql\_db) | Full Details of the mysql db Module |
<!-- END_TF_DOCS -->