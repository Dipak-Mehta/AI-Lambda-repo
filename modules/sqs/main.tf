variable "prefix" {}

resource "aws_sqs_queue" "queue" {
  name = "${var.prefix}-queue"
}
