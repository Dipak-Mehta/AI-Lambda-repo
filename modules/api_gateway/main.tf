resource "aws_api_gateway_rest_api" "api" {
  name = "${var.prefix}-api"
}

# ---------- ROUTES ----------
locals {
  routes = {
    upload   = var.upload_lambda_arn
    download = var.download_lambda_arn
    fetch    = var.fetch_lambda_arn
    search   = var.search_lambda_arn
  }
}

resource "aws_api_gateway_resource" "resource" {
  for_each    = local.routes
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = each.key
}

resource "aws_api_gateway_method" "method" {
  for_each      = local.routes
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource[each.key].id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  for_each                = local.routes
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.resource[each.key].id
  http_method             = aws_api_gateway_method.method[each.key].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri = "arn:aws:apigateway:ap-south-1:lambda:path/2026-03-17/functions/${each.value}/invocations"
}

# ---------- PERMISSIONS ----------
resource "aws_lambda_permission" "apigw" {
  for_each = local.routes

  statement_id  = "AllowAPIGatewayInvoke-${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = each.value
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}

# ---------- DEPLOYMENT ----------
resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = "dev"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}
