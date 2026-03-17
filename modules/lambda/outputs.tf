output "upload_lambda_arn" {
  value = aws_lambda_function.upload.arn
}

output "download_lambda_arn" {
  value = aws_lambda_function.download.arn
}

output "fetch_lambda_arn" {
  value = aws_lambda_function.fetch.arn
}

output "search_lambda_arn" {
  value = aws_lambda_function.search.arn
}
