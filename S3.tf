resource "aws_s3_bucket" "vpc_flow_logs_bucket" {
  bucket = "log-analysis-bucket-${random_string.random.result}" # Replace with a unique bucket name

}

resource "aws_s3_bucket_public_access_block" "vpc_flow_logs_access_block" {
  bucket = aws_s3_bucket.vpc_flow_logs_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "random_string" "random" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric = true
}