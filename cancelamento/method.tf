resource "aws_api_gateway_method" "cancelamento_method" {
  rest_api_id   = var.rest_api_id
  resource_id   = aws_api_gateway_resource.cancelamento_route.id
  http_method   = "POST"
  authorization = "NONE"
}
