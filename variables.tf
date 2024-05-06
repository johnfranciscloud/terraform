variable "table_name" {
    description = "The table name of the DynamoDB"
    type = string
    nullable = false
  
}

variable "key_name" {
    description = "The key used for hash(partition)"
    type = string
    nullable = false
  
}

variable "s3bucket_name" {
    description = "The name for the S3-Bucket"
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

variable "iam_role_for_lambda" {
    description = "IAM Role for Lambda"
    type = string
    nullable = false
  
}
variable "iam_policy_name_for_sfn" {
    description = "IAM policy name for State Function"
    type = string
    nullable = false
  
}

variable "iam_policy_attachment_to_lambda" {
    description = "IAM policy attachment name to Lambda for step function"
    type = string
    nullable = false
  
}

variable "archive_type" {
    description = "Specifies the type of archive file to create."
    type = string
    nullable = false
  
}

variable "source_file" {
    description = "Specifies the path to the file or directory that you want to include in the archive"
    type = string
    nullable = false
  
}

variable "iam_policy_file_path_for_sfn" {
    description = "IAM policy json file for sfn"
    type = string
    nullable = false
  
}

variable "iam_policy_sfn_arn_for_lambda" {
    description = "IAM sfn policy for Lambda"
    type = string
    nullable = false
  
}

variable "iam_cloudwatch_policy_for_lambda" {
    description = "IAM cloudwatch policy for Lambda"
    type = string
    nullable = false
  
}

variable "archive_file_output_path" {
    description = "The output of the archive file"
    type = string
    nullable = false
  
}

variable "zip_file_path" {
    description = "Path to the archived zip file"
    type = string
    nullable = false
  
}

variable "lambda_function_name" {
    description = "Unique name for your Lambda Function."
    type = string
    nullable = false
  
}

variable "lambda_function_handler" {
    description = "Lambda Function handler"
    type = string
    nullable = false
  
}

variable "lambda_function_runtime" {
    description = "Lambda Function runtime"
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

variable "iam_role_for_sfn" {
    description = "IAM Role for sfn"
    type = string
    nullable = false
  
}

variable "assume_role_policy_for_sfn" {
    description = "IAM assume role policy for sfn"
    type = string
    nullable = false
}