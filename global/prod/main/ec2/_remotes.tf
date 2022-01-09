data "terraform_remote_state" "global_prod_main_remote" {
  backend = "s3"
  config = {
    bucket = "brightkey-terraform-globalnetwork-state-file-storage"
    key    = "global/prod/main/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ap_east_1_main_prod_remote" {
  backend = "s3"
  config = {
    bucket = "brightkey-terraform-globalnetwork-state-file-storage"
    key    = "ap-east-1/prod/main/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_east_1_main_prod_remote" {
  backend = "s3"
  config = {
    bucket = "brightkey-terraform-globalnetwork-state-file-storage"
    key    = "us-east-1/prod/main/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_west_2_main_prod_remote" {
  backend = "s3"
  config = {
    bucket = "brightkey-terraform-globalnetwork-state-file-storage"
    key    = "us-west-2/prod/main/terraform.tfstate"
    region = "us-east-1"
  }
}

