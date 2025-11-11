resource "aws_cloudwatch_event_rule" "console" {
  name        = "capture-aws-sign-in"
  description = "Capture each AWS Console Sign In"

  event_pattern = jsonencode({
    "source": ["aws.s3"]
    "detail-type": ["AWS API Call via CloudTrail"]
    "detail": {
      "eventSource": ["s3.amazonaws.com"]
      "eventName": ["PutObject"]
    }
  })
}

resource "aws_cloudwatch_event_target" "send_to_grafana" {
  rule      = aws_cloudwatch_event_rule.console.name
  target_id = "send-to-grafana"
  arn       = aws_lambda_function.send_to_s3.arn
}