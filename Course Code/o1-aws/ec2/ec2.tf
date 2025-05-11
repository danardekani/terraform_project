# Requirements
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "security-research"

}

resource "aws_ami" "terraform_aws_practice" {
  name = "terraform_awsEC2_prac"
}