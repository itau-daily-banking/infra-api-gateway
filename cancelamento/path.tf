resource "aws_api_gateway_resource" "cancelamento_route" {
  rest_api_id = var.rest_api_id
  parent_id   = var.parent_id
  path_part   = "cancelamento"
}
