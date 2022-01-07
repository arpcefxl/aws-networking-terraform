terraform {
  backend "s3" {
    key            = "ap-east-1/prod/main/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "brightkey-terraform-globalnetwork-state-file-storage"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}
