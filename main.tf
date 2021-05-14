provider "aws" {
  region = var.aws_region
}

provider "random" {}

resource "random_pet" "table_name" {}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = "${var.db_table_name}-${random_pet.table_name.id}"

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"

  attribute {
    name = "UUID"
    type = "S"
  }
  }
  resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}
output "resource_code" {
  value = random_string.resource_code.result
}
