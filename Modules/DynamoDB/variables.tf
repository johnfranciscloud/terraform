variable "table_name" {
    type = string
    nullable = false
  
}

variable "key_name" {
    type = string
    nullable = false
  
}
variable "billing_mode" {
    description = "The billing mode for DynamoDB table"
    type = string
    nullable = false
    
}

variable "read_capacity" {
    description = "The read capacity for DynamoDB table"
    type = number
    nullable = false
    
}

variable "write_capacity" {
    description = "The write capacity for DynamoDB table"
    type = number
    nullable = false
  
}

variable "attribute_type" {
    description = "The data type of DynamoDB table attribute"
    type = string
    nullable = false
  
}

