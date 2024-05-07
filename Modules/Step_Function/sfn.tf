resource "aws_iam_role" "iam_for_sfn" {
  name = var.iam_role_for_sfn
  assume_role_policy = file("./Modules/Step_Function/assume_role_policy.json")
}

resource "aws_iam_policy" "policy_for_dynamodb" {

 name = var.iam_policy_name_for_dynamodb
 policy = file("./Modules/Step_Function/policy_dynamodb.json")

}

resource "aws_iam_policy_attachment" "attach_policy_to_role_sfn" {
  name       = var.iam_policy_attachment_to_sfn
  roles      = [aws_iam_role.iam_for_sfn.name]
  policy_arn = aws_iam_policy.policy_for_dynamodb.arn
}

resource "aws_iam_policy_attachment" "attach_policy_cloudwatch_sfn" {
  name       = var.iam_policy_attachment_to_cloudwatch_sfn
  roles      = [aws_iam_role.iam_for_sfn.name]
  policy_arn = var.iam_cloudwatch_policy_for_sfn
}

resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.state_machine_name
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
    "Comment": "A description of my state machine",
    "StartAt": "CreateUserOnDynamoDB",
    "States": {
      "CreateUserOnDynamoDB": {
        "Type": "Task",
        "Resource": "arn:aws:states:::dynamodb:putItem",
        "Parameters": {
          "TableName": "Files",
          "Item": {
            "FileName": {
              "S.$": "$.file_name"
            }
          }
        },
        "ResultPath": "$.dynamodbPut",
        "End": true
      }
    }
  }
EOF
}
