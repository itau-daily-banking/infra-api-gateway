resource "aws_api_gateway_integration" "cancelamento_integration" {
  rest_api_id             = var.rest_api_id
  resource_id             = aws_api_gateway_resource.cancelamento_route.id
  http_method             = aws_api_gateway_method.cancelamento_method.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"

  uri = "${var.url_base}/cancelamento"

  request_templates = {
    "application/json" = <<EOF
{
  "statusCode": 200
}
EOF
  }
}
