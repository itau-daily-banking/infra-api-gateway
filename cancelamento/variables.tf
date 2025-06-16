variable "region" {
  description = "A região AWS onde a infraestrutura será provisionada."
  default     = "us-east-1"
}

variable "url_base" {
  description = "url base aplicaçao eks"
  type        = string
  default     = "http://k8s-default-ingressa-0faf251d7e-1124737897.sa-east-1.elb.amazonaws.com/debito/v1"
}

variable "rest_api_id" {
  description = "ID da API Gateway"
  type        = string
}

variable "parent_id" {
  description = "ID do recurso pai para a API"
  type        = string
}

variable "exec_arn" {
  description = "ID do recurso pai para a API"
  type        = string
}
