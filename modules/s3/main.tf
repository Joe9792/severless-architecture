variable "bucket_name" {}
variable "lambda_function_arn" {}

resource "aws_s3_bucket" "genomic_data" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "genomic_data" {
  bucket = aws_s3_bucket.genomic_data.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.genomic_data.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_s3_bucket_policy" "genomic_data_policy" {
  bucket = aws_s3_bucket.genomic_data.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "${aws_s3_bucket.genomic_data.arn}",
          "${aws_s3_bucket.genomic_data.arn}/*"
        ]
      }
    ]
  })
}
