variable "lambda_function_arn" {
  type     = string
  nullable = false 
}

variable "s3bucket_name" {
    type = string
    nullable = false 
}

variable "s3_tf_statement_id" {
    description = "Terraform statement id"
    type = string
    nullable = false 
}

variable "allowed_lambda_action" {
    description = "Allowed action for Lambda"
    type = string
    nullable = false 
}

variable "s3_force_destroy" {
    description = "Delete S3 bucket by force"
    type = bool 
}

variable "lambda_function_event" {
    description = "Name of lambda function event"
    type = set(string)
    nullable = false  
}
