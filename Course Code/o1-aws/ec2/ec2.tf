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

resource "aws_instance" "terraform_aws_practice" {
  ami = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name = "TerraformPracticeInstance-1"
  }
}