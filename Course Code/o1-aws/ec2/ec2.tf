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

# Definte EC2 instance parameters
resource "aws_instance" "terraform_aws_practice" {
  ami = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"

  # Main EBS Volume that is attached to an EC2 instance
  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name = "TerraformPracticeInstance-1"
  }
}

# Data source for searching AWS for EBS volumes attached to this specific instance
data "aws_ebs_volumes" "root_volume" {
  depends_on = [aws_instance.terraform_aws_practice]

  filter {
    name   = "attachment.instance-id"
    values = [aws_instance.terraform_aws_practice.id]
  }
}

# This block create a root snapshot
resource "aws_ebs_snapshot" "root_snapshot" {
  volume_id = data.aws_ebs_volumes.root_volume.ids[0]

  tags = {
    Name = "RootVolumeSnapshot"
  }
  lifecycle {
    prevent_destroy = true
  }
}