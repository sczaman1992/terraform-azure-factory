module "mysql_db" {
  source    = "../"
  mysql_dir = "${path.module}/sample-data"
}

output "mysql_db" {
  value = module.mysql_db
}
