variable "prefix" {}

resource "aws_s3_bucket" "upload" {
  bucket = "${var.prefix}-upload"
}

resource "aws_s3_bucket" "processed" {
  bucket = "${var.prefix}-processed"
}
