terraform {
  backend "s3" {
    bucket         = "jacob-terraform-state-bucket"
    key            = "dev/aws/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}