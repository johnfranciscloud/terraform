resource "aws_iam_role" "iam_role_for_lambda" {
  name = var.iam_role_for_lambda
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
    
  ]
}
EOF
}

resource "aws_iam_policy" "policy_for_sfn" {

  name = var.iam_policy_name_for_sfn
  policy = file(var.iam_policy_file_path_for_sfn)

}

resource "aws_iam_policy_attachment" "attach-policy" {
  name       = var.iam_policy_attachment_to_lambda
  roles      = [aws_iam_role.iam_role_for_lambda.name]
  policy_arn = aws_iam_policy.policy_for_sfn.arn
}

resource "aws_iam_policy_attachment" "attach-policy-cloudwatch1" {
  name       = var.iam_policy_attachment_to_lambda
  roles      = [aws_iam_role.iam_role_for_lambda.name]
  policy_arn = var.iam_cloudwatch_policy_for_lambda
}

data "archive_file" "test" {
  type        = var.archive_type
  source_file = var.source_file
  output_path = var.archive_file_output_path
}

resource "aws_lambda_function" "function" {
  filename      = var.zip_file_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_role_for_lambda.arn
  handler       = var.lambda_function_handler
  runtime       = var.lambda_function_runtime

  environment {
    variables = {
      sfn_arn = var.sfn_state_machine_arn
    }
  }

}
