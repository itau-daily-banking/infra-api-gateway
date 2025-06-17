variable "region" {
  description = "A região AWS onde a infraestrutura será provisionada."
  default     = "us-east-1"
}

variable "s3_backend_bucket_name" {
  description = "Nome do bucket S3 para armazenar o estado do Terraform"
  type        = string
  default     = "itau-case-tfstate"
}

variable "s3_backend_key" {
  description = "Nome do key do bucket S3 para armazenar o estado do Terraform"
  type        = string
  default     = "api-gateway/terraform.tfstate"
}

variable "url_base" {
  description = "url base aplicaçao eks"
  type        = string
  default     = "http://k8s-default-ingressd-d7e6531aa6-744753452.us-east-1.elb.amazonaws.com/api/v1/cancelamentos"
}
