variable "prefix" {}
variable "lambda_role" {}
variable "zip_file" {}

resource "aws_lambda_function" "upload" {

  function_name = "${var.prefix}-upload"
  filename      = "lambda/upload.zip"
  handler       = "app.lambda_handler"
  runtime       = "python3.10"
  role          = var.lambda_role
}

resource "aws_lambda_function" "download" {

  function_name = "${var.prefix}-download"
  filename      = "lambda/download.zip"
  handler       = "app.lambda_handler"
  runtime       = "python3.10"
  role          = var.lambda_role
}

resource "aws_lambda_function" "fetch" {

  function_name = "${var.prefix}-fetch"
  filename      = "lambda/fetch.zip"
  handler       = "app.lambda_handler"
  runtime       = "python3.10"
  role          = var.lambda_role
}

resource "aws_lambda_function" "search" {

  function_name = "${var.prefix}-search"
  filename      = "lambda/search.zip"
  handler       = "app.lambda_handler"
  runtime       = "python3.10"
  role          = var.lambda_role
}
