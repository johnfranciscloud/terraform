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