terraform {
  backend "s3" {
    bucket         = "prod-terraform-state-bucket"
    key            = "prod/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "prod-terraform-lock-table"
    encrypt        = true
  }
}
