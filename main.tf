terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {
    bucket = "projeto2023-terraformoschetta"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "renatomsouza"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  depends_on = [ aws_vpc.vpc, aws_subnet.subnet ]
  backend = "s3"
  config = {
    bucket = "projeto2023-terraformoschetta"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}