# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket  = "demo-01-terraform"
    key     = "terraform/ecs/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}

# Config credentials for AWS
provider "aws" {
  region = "us-east-2"
}
