terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = ">= 5.0, < 7.0" }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "requested_bucket" {
  source = "git::https://github.com/aldo2510/terraform-aws-modules.git//modules/s3?ref=main"
  bucket_name = "aldo-lab-demo-2026"
  versioning_enabled = true
  tags = {
    Environment = "dev"
    ManagedBy = "genai-infrastructure-platform"
  }
}
