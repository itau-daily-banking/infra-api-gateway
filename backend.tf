terraform {
  backend "s3" {
    bucket = "itau-case-tfstate"
    key    = "api-gateway/terraform.tfstate"
    region = "us-east-1"
  }
}