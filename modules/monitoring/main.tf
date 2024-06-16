variable "lambda_function_name" {}
variable "slack_webhook_url" {}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}

resource "aws_cloudtrail" "trail" {
  name                          = "GenomicDataTrail"
  s3_bucket_name                = aws_s3_bucket.genomic_data.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}

resource "aws_cloudwatch_event_rule" "lambda_error_rule" {
  name        = "LambdaErrorRule"
  description = "Capture all Lambda function errors"
  event_pattern = jsonencode({
    "source": ["aws.lambda"],
    "detail-type": ["Lambda Function Invocation Result"],
    "detail": {
      "requestContext": {
        "condition": ["functionerror"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "send_to_sns" {
  rule      = aws_cloudwatch_event_rule.lambda_error_rule.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.lambda_errors.arn
}
