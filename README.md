# AWS Terraform Controller & Nested Infrastructure

## Project Overview
This project demonstrates nested infrastructure provisioning on AWS using
Terraform running inside an Ubuntu EC2 instance.

## Technologies Used
- AWS EC2
- AWS IAM and STS
- Amazon S3
- Terraform
- Ubuntu Linux
- AWS CLI
- Git and GitHub

## Architecture
1. An Ubuntu EC2 instance acts as the Terraform execution environment.
2. An IAM role is attached to the EC2 instance.
3. AWS STS verifies role-based authentication.
4. Terraform generates a unique suffix for an S3 bucket.
5. Terraform provisions an S3 bucket in us-east-1.
6. AWS CLI verifies the bucket.

## Terraform Resources
- random_id.bucket_suffix
- aws_s3_bucket.test_bucket

## Deployment Commands
    terraform init
    terraform validate
    terraform plan
    terraform apply
    terraform state list
    terraform output

## AWS Authentication
The EC2 instance uses its attached IAM role instead of hardcoded AWS
access keys. Authentication was verified using aws sts get-caller-identity.

## Deployment Result
- Region: us-east-1
- S3 bucket: nested-tf-bucket-f2cd8735
- Terraform resources created: 2

## Cleanup
Run terraform destroy from this directory to remove the resources managed
by this Terraform configuration.

## Assignment Note
The EC2 controller was created manually in the AWS Console. The outer
Terraform provisioning stage from the assignment guide remains to be implemented.

## Security
Terraform state files, provider directories, private keys, and credentials
must not be committed to GitHub.
