# Outputs for S3 Module
output "s3_bucket_id" {
  value = module.s3.bucket_id
}

# Outputs for Lambda Module
output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

# Outputs for DynamoDB Module
output "dynamodb_table_name" {
  value = module.dynamodb.dynamodb_table_name
}

# Outputs for RDS Module
output "rds_instance_identifier" {
  value = module.rds.rds_instance_identifier
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

# Outputs for API Gateway Module
output "api_gateway_id" {
  value = module.api_gateway.api_gateway_id
}

output "api_execution_arn" {
  value = module.api_gateway.api_execution_arn
}

# Outputs for Monitoring Module
output "cloudwatch_log_group_name" {
  value = module.monitoring.cloudwatch_log_group_name
}

output "cloudtrail_name" {
  value = module.monitoring.cloudtrail_name
}
