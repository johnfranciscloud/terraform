resource "aws_dynamodb_table" "Files_table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.key_name
 

  attribute {
    name = var.key_name
    type = var.attribute_type
  }

}