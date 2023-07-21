locals {
  cosmosdb_dir = var.cosmosdb_dir
  cosmosdb_db_map = {
    for f in fileset("${local.cosmosdb_dir}", "**/*.yaml") :
    yamldecode(file("${local.cosmosdb_dir}/${f}")).cosmosdb_db.cosmos_db_name => yamldecode(file("${local.cosmosdb_dir}/${f}")).cosmosdb_db
  }

}

module "cosmosdb" {
  source                = "./modules/cosmosdb"
  for_each              = local.cosmosdb_db_map
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  cosmos_db_name        = each.value.cosmos_db_name
  cosmosdb_account      = each.value.cosmosdb_account
  failover_locations    = each.value.failover_locations
  capabilities          = each.value.capabilities
  virtual_network_rules = each.value.virtual_network_rules
}

module "mongodb" {
  source                = "./modules/mongodb"
  for_each              = local.cosmosdb_db_map
  resource_group_name   = each.value.resource_group_name
  mongo_db_name         = each.value.mongo_db_name
  max_throughput        = each.value.max_throughput
  cosmosdb_account_name = module.cosmosdb[each.value.cosmos_db_name].cosmosdb_name
  depends_on = [
    module.cosmosdb
  ]
}