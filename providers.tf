terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
  # access_key = "AKIAXTORPWCGN6KOUP6Y"
  # secret_key = "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"
}
