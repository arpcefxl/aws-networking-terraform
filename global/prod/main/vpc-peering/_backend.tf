terraform {
  backend "s3" {
    key            = "global/prod/main/vpc-peering/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "brightkey-terraform-globalnetwork-state-file-storage"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}
