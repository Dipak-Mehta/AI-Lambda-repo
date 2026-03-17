output "api_endpoint" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.ap-south-1.amazonaws.com/dev"
}
