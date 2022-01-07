data "terraform_remote_state" "global_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global_stage_main_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "global/stage/main/terraform.tfstate"
    region = "us-east-1"
  }
}

#data "terraform_remote_state" "ap_east_1_main_stage_remote" {
#  backend = "s3"
#  config = {
#    bucket = "terraform-globalnetwork-state-file-storage"
#    key    = "ap-east-1/stage/main/terraform.tfstate"
#    region = "us-east-1"
#  }
#}

#data "terraform_remote_state" "ap_southeast_1_main_stage_remote" {
#  backend = "s3"
#  config = {
#    bucket = "terraform-globalnetwork-state-file-storage"
#    key    = "ap-southeast-1/stage/main/terraform.tfstate"
#    region = "us-east-1"
#  }
#}

data "terraform_remote_state" "us_east_1_main_stage_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "us-east-1/stage/main/terraform.tfstate"
    region = "us-east-1"
  }
}

#data "terraform_remote_state" "eu_central_1_main_stage_remote" {
#  backend = "s3"
#  config = {
#    bucket = "terraform-globalnetwork-state-file-storage"
#    key    = "eu-central-1/stage/main/terraform.tfstate"
#    region = "us-east-1"
#  }
#}

data "terraform_remote_state" "us_west_2_main_stage_remote" {
  backend = "s3"
  config = {
    bucket = "terraform-globalnetwork-state-file-storage"
    key    = "us-west-2/stage/main/terraform.tfstate"
    region = "us-east-1"
  }
}

