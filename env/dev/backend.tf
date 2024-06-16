terraform {
  backend "s3" {
    bucket         = "dev-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "dev-terraform-lock-table"
    encrypt        = true
  }
}
