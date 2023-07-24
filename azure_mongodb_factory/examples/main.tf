module "cosmosdb_example" {
  source       = "../"
  cosmosdb_dir = "./sample-data"
}

output "cosmosdb" {
  value = module.cosmosdb_example
}
