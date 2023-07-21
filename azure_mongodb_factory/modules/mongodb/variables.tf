variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  type        = string
}

variable "mongo_db_name" {
  description = "Specifies the name of the MongoDB Database."
  type        = string
}

variable "max_throughput" {
  description = "The maximum throughput of the MongoDB database (RU/s)."
  type        = number
}

variable "cosmosdb_account_name" {
  description = "Cosmosdb Account Name"
  type        = string
}