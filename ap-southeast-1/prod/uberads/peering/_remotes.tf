data "terraform_remote_state" "global_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global_prod_uberads_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/prod/uberads/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ap_southeast_1_uberads_prod_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "ap-southeast-1/prod/uberads/terraform.tfstate"
    region = "us-east-1"
  }
}
