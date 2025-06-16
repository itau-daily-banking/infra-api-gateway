provider "aws" {
  region = "us-east-1"
}

resource "aws_api_gateway_rest_api" "api" {
  name        = "DailyBankingCase"
  description = "API Gateway para gerenciar o cancelamento do débito automático."
}

resource "aws_api_gateway_resource" "debito_v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "debito"
}

resource "aws_api_gateway_resource" "v1" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.debito_v1.id
  path_part   = "v1"
}

module "cancelamento" {
  source      = "./cancelamento" # Pasta onde estará seu módulo cancelamento
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.v1.id
  exec_arn    = aws_api_gateway_rest_api.api.execution_arn
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    module.cancelamento.cancelamento_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}
