resource "aws_s3_bucket" "file_upload_s3_bucket" {
  bucket = var.s3bucket_name
  force_destroy = var.s3_force_destroy
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = var.s3_tf_statement_id
  action        = var.allowed_lambda_action
  function_name = var.lambda_function_arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.file_upload_s3_bucket.arn

}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.file_upload_s3_bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = var.lambda_function_event
  }

depends_on = [aws_lambda_permission.allow_bucket]
}