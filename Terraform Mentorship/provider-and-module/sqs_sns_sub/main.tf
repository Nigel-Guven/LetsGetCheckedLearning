resource "aws_sqs_queue" "my_service_queue" {
  name                      = "${var.environment}_${var.sqs_name}"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = var.environment
  }
}

resource "aws_sns_topic" "my_service_sns_topic" {
  name = "${var.environment}_${var.sns_name}"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  topic_arn = aws_sns_topic.my_service_sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.my_service_queue.arn
}