module "cosmosdb" {
  source       = "../"
  cosmosdb_dir = "${path.module}/sample-data"
}

output "cosmosdb" {
  value = module.cosmosdb
}
