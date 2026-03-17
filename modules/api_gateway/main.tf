resource "aws_apigatewayv2_api" "api" {

  name = "${var.prefix}-api"

  protocol_type = "HTTP"

}
