#output "project" {
#  value = var.project_name
#}


output "api_gateway_endpoint" {
  value = module.api_gateway.api_endpoint
}

output "upload_lambda" {
  value = module.lambda.upload_lambda
}

output "download_lambda" {
  value = module.lambda.download_lambda
}

output "fetch_lambda" {
  value = module.lambda.fetch_lambda
}

output "search_lambda" {
  value = module.lambda.search_lambda
}

output "upload_bucket" {
  value = module.s3.upload_bucket
}

output "processed_bucket" {
  value = module.s3.processed_bucket
}

output "dynamodb_table" {
  value = module.dynamodb.documents_table
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}
