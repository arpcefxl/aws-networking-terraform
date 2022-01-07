terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
      configuration_aliases = [ aws.source-region, aws.destination-region ]
    }
  }
}

provider "aws" {
  alias  = "source-region"
  region = var.source_region
}

provider "aws" {
  alias  = "destination-region"
  region = var.destination_region
}
