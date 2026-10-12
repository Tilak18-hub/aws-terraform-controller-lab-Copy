terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "test_bucket" {
  bucket        = "nested-tf-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    CreatedBy   = "EC2-Terraform-Runner"
    Environment = "Nested-Lab"
  }
}

output "created_bucket_name" {
  description = "Name of the S3 bucket created by nested Terraform"
  value       = aws_s3_bucket.test_bucket.bucket
}
