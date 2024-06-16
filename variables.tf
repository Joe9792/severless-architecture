# S3 Module Variables
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "genomic-data-bucket"
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
  default     = "arn:aws:lambda:us-west-2:123456789012:function:ProcessGenomicData"
}

# Lambda Module Variables
variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
  default     = "ProcessGenomicData"
}

variable "role_arn" {
  description = "The ARN of the IAM role for the Lambda function"
  type        = string
  default     = "arn:aws:iam::123456789012:role/lambda_exec_role"
}

variable "handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "index.handler"
}

variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "nodejs14.x"
}

variable "source_code_hash" {
  description = "The source code hash for the Lambda function"
  type        = string
  default     = ""
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "GenomicData"
}

variable "rds_endpoint" {
  description = "The endpoint for the RDS instance"
  type        = string
  default     = "genomicdb-instance.123456789012.us-west-2.rds.amazonaws.com"
}

variable "api_gateway_arn" {
  description = "The ARN of the API Gateway"
  type        = string
  default     = "arn:aws:apigateway:us-west-2::/restapis/a1b2c3d4e5"
}

# DynamoDB Module Variables
variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "GenomicData"
}

# RDS Module Variables
variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "genomicdb-instance"
}

variable "db_name" {
  description = "The name of the RDS database"
  type        = string
  default     = "genomicdb"
}

variable "username" {
  description = "The username for the RDS database"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "The password for the RDS database"
  type        = string
  default     = "password123"
}

# API Gateway Module Variables
variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
  default     = "GenomicDataAPI"
}

# Monitoring Module Variables
variable "slack_webhook_url" {
  description = "The Slack webhook URL for notifications"
  type        = string
  default     = "https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function for logging"
  type        = string
  default     = "ProcessGenomicData"
}

