terraform {
  backend "s3" {
    key            = "eu-central-1/prod/uberads/peering/terraform.tfstate"
    region         = "us-east-1"
    bucket         = "brightkey-terraform-globalnetwork-state-file-storage"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true # Optional, S3 Bucket Server Side Encryption
  }
}
