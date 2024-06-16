variable "function_name" {}
variable "role_arn" {}
variable "handler" {}
variable "runtime" {}
variable "source_code_hash" {}
variable "dynamodb_table" {}
variable "rds_endpoint" {}
variable "api_gateway_arn" {}

resource "aws_lambda_function" "process_genomic_data" {
  filename         = "lambda_function_payload.zip"
  function_name    = var.function_name
  role             = var.role_arn
  handler          = var.handler
  source_code_hash = var.source_code_hash
  runtime          = var.runtime
  timeout          = 900
  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table
      RDS_ENDPOINT   = var.rds_endpoint
    }
  }
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.process_genomic_data.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.api_gateway_arn
}
