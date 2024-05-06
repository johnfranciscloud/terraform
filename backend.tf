terraform {
 backend "s3" {
   bucket         = "john-assesment-terraform-state"
   key            = "state/terraform.tfstate"
   region         = "eu-central-1"
   encrypt        = true
   kms_key_id     = "3da6d612-25a0-4158-ad7a-bbebb4770fb3"
   dynamodb_table = "terraform-state"
 }
}