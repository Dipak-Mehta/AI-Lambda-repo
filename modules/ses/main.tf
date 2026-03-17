variable "prefix" {}
variable "email_sender" {}

resource "aws_ses_email_identity" "sender" {
  email = var.email_sender
}
