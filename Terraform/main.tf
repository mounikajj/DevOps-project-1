# 1. Version Settings
terraform {
  required_version = ">= 1.1.0" # Minimum CLI version allowed

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use any version from 5.0 to 5.9
    }
  }
}

# 2. Provider Configuration
provider "aws" {
  region = "ap-south-1" # Mumbai Region
}





