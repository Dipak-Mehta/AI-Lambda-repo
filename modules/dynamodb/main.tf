variable "prefix" {}

resource "aws_dynamodb_table" "documents" {

  name = "${var.prefix}-documents"

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "document_id"

  attribute {
    name = "document_id"
    type = "S"
  }

}
