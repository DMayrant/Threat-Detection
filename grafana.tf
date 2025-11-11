
resource "aws_grafana_workspace" "log_analysis_grafana" {
  account_access_type      = "CURRENT_ACCOUNT"
  authentication_providers = ["SAML"]
  permission_type          = "SERVICE_MANAGED"
  role_arn                 = aws_iam_role.assume.arn
  vpc_configuration {
    subnet_ids         = aws_subnet.private_subnet[*].id
    security_group_ids = [aws_security_group.grafana_sg.id]


  }

}

resource "aws_iam_role" "assume" {
  name = "grafana-assume"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "grafana.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "grafana_s3_read" {
  name        = "grafana-s3-read"
  description = "Allow Grafana to read objects from specific S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::your-bucket-name",              # list bucket
          "arn:aws:s3:::your-bucket-name/*"            # read objects
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3" {
  role       = aws_iam_role.assume.name
  policy_arn = aws_iam_policy.grafana_s3_read.arn
}
