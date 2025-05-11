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
  name = "aws_tf_prac"
  ami = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformPracticeInstance"
  }
}