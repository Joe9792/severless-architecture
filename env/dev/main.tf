module "s3" {
  source            = "../../modules/s3"
  bucket_name       = "dev-genomic-data-bucket"
  lambda_function_arn = module.lambda.lambda_function_arn
}

module "lambda" {
  source            = "../../modules/lambda"
  function_name     = "dev-ProcessGenomicData"
  role_arn          = aws_iam_role.lambda_exec_role.arn
  handler           = "index.handler"
  runtime           = "nodejs14.x"
  source_code_hash  = filebase64sha256("lambda_function_payload.zip")
  dynamodb_table    = module.dynamodb.table_name
  rds_endpoint      = module.rds.db_endpoint
  api_gateway_arn   = module.api_gateway.api_execution_arn
}

module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "dev-GenomicData"
}

module "rds" {
  source                 = "../../modules/rds"
  db_instance_identifier = "dev-genomicdb"
  db_name                = "genomicdb"
  username               = "admin"
  password               = "password123"
}

module "api_gateway" {
  source              = "../../modules/api_gateway"
  api_name            = "DevGenomicDataAPI"
  lambda_function_arn = module.lambda.lambda_function_arn
}

module "monitoring" {
  source               = "../../modules/monitoring"
  lambda_function_name = module.lambda.function_name
  slack_webhook_url    = "https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK"
}
