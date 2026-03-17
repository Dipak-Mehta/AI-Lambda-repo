output "upload_lambda" {
  value = aws_lambda_function.upload.function_name
}

output "download_lambda" {
  value = aws_lambda_function.download.function_name
}

output "fetch_lambda" {
  value = aws_lambda_function.fetch.function_name
}

output "search_lambda" {
  value = aws_lambda_function.search.function_name
}
