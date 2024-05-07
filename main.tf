module "step_function"{
  source = "./Modules/Step_Function"
  iam_role_for_sfn = var.iam_role_for_sfn
  iam_policy_name_for_dynamodb = var.iam_policy_name_for_dynamodb
  iam_policy_attachment_to_sfn = var.iam_policy_attachment_to_sfn
  iam_policy_attachment_to_cloudwatch_sfn = var.iam_policy_attachment_to_cloudwatch_sfn
  state_machine_name = var.state_machine_name
  iam_cloudwatch_policy_for_sfn = var.iam_cloudwatch_policy_for_sfn
}

module "lambda"{
  iam_role_for_lambda = var.iam_role_for_lambda
  iam_policy_name_for_sfn = var.iam_policy_name_for_sfn
  iam_policy_attachment_to_lambda = var.iam_policy_attachment_to_lambda
  source = "./Modules/Lambda"
  archive_type = var.archive_type
  source_file = var.source_file
  sfn_state_machine_arn = module.step_function.sfn_state_machine_arn
  iam_policy_file_path_for_sfn = var.iam_policy_file_path_for_sfn
  iam_cloudwatch_policy_for_lambda = var.iam_cloudwatch_policy_for_lambda
  iam_policy_sfn_arn_for_lambda = var.iam_policy_sfn_arn_for_lambda
  archive_file_output_path = var.archive_file_output_path
  zip_file_path = var.zip_file_path
  lambda_function_name = var.lambda_function_name
  lambda_function_handler = var.lambda_function_handler
  lambda_function_runtime = var.lambda_function_runtime
}

module "S3"{
  source = "./Modules/S3_Bucket"
  lambda_function_arn = module.lambda.lambda_function_arn
  s3bucket_name = var.s3bucket_name
  s3_tf_statement_id = var.s3_tf_statement_id
  allowed_lambda_action = var.allowed_lambda_action
  s3_force_destroy = var.s3_force_destroy
  lambda_function_event = var.lambda_function_event

}

module "dynamodb"{
  source = "./Modules/DynamoDB"
  table_name = var.table_name
  key_name = var.key_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  attribute_type = var.attribute_type

}
