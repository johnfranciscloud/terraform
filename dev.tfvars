######################################### DYNAMODB ##############################################
table_name = "Files"
key_name  = "FileName" 
billing_mode = "PROVISIONED"
read_capacity = "20"
write_capacity = "20"
attribute_type = "S"

######################################### LAMBDA #################################################
iam_role_for_lambda = "iam_role_for_lambda"
iam_policy_name_for_sfn = "policy_for_sfn"
iam_policy_attachment_to_lambda = "attach_policy_to_role"
archive_type = "zip"
source_file = "Modules/lambda/lambda-sfn.py"
iam_policy_file_path_for_sfn = "Modules/Lambda/policy_sfn.json"
iam_policy_sfn_arn_for_lambda = "aws_iam_policy.policy_for_sfn.arn"
iam_cloudwatch_policy_for_lambda = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
archive_file_output_path = "../output/lambda_sfn_1.zip"
zip_file_path = "../output/lambda_sfn_1.zip"
lambda_function_name = "sfn_invoke"
lambda_function_handler = "lambda-sfn.upload"
lambda_function_runtime = "python3.9"

######################################### S3 BUCKET ##############################################
s3bucket_name = "file-upload-s3bucket-john"
s3_tf_statement_id = "AllowExecutionFromS3Bucket"
allowed_lambda_action = "lambda:InvokeFunction"
s3_force_destroy = true

######################################### STEP FUNCTION ###########################################
iam_role_for_sfn = "iam_for_sfn"
assume_role_policy_for_sfn = "Modules/Step_Function/assume_role_policy.json"