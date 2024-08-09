# Create an SNS Topic
resource "aws_sns_topic" "user_updates" {
  name = var.sns_topic_name
}

# Create an SNS Topic Subscription
resource "aws_sns_topic_subscription" "notification_topic" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = var.sns_subscription_protocol
  endpoint  = var.sns_subscription_endpoint
}
