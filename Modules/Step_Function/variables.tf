variable "iam_role_for_sfn" {
    description = "IAM Role for sfn"
    type = string
    nullable = false
}

variable "iam_policy_name_for_dynamodb" {
    description = "IAM Role for dynamodb"
    type = string
    nullable = false
  
}

variable "iam_policy_attachment_to_sfn" {
    description = "IAM policy attachment name for sfn"
    type = string
    nullable = false
  
}

variable "iam_policy_attachment_to_cloudwatch_sfn" {
    description = "IAM policy attachment name for cloudwatch for sfn"
    type = string
    nullable = false
  
}

variable "state_machine_name" {
    description = "Name of the state machine"
    type = string
    nullable = false
  
}

variable "iam_cloudwatch_policy_for_sfn" {
    description = "IAM cloudwatch policy for sfn"
    type = string
    nullable = false
  
}
