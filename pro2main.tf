terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4"
    }
  }
}

provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA4G2M25YZKVDS4Q7R"
  secret_key = "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"
}
