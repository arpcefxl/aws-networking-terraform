data "terraform_remote_state" "global_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global_stage_uberads_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/stage/uberads/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_west_2_uberads_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "us-west-2/stage/uberads/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "us_east_1_uberads_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "us-east-1/stage/uberads/terraform.tfstate"
    region = "us-east-1"
  }
}
