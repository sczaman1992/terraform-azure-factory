locals {
  mysql_dir = var.mysql_dir
  mysql_db_map = {
    for f in fileset("${local.mysql_dir}", "**/*.yaml") :
    yamldecode(file("${local.mysql_dir}/${f}")).mysql_db.mysql_server_name => yamldecode(file("${local.mysql_dir}/${f}")).mysql_db
  }

}

module "mysql_db" {
  source                               = "./modules/mssql_database"
  for_each                             = local.mysql_db_map
  mysql_server_name                    = each.value.mysql_server_name
  resource_group_name                  = each.value.resource_group_name
  location                             = each.value.location
  db_version                           = each.value.db_version
  administrator_login                  = each.value.administrator_login
  administrator_login_password         = each.value.administrator_login_password
  azuread_administrator                = each.value.azuread_administrator
  connection_policy                    = each.value.connection_policy
  minimum_tls_version                  = each.value.minimum_tls_version
  public_network_access_enabled        = each.value.public_network_access_enabled
  outbound_network_restriction_enabled = each.value.outbound_network_restriction_enabled
  tags                                 = each.value.tags
  mysql_database_map                   = each.value.mysql_database_map
}



variable "mysql_dir" {
  type = string
}