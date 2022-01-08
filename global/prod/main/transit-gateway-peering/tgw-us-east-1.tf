module "us_east_1_tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  name    = "us-east-1-main-tgw"

  providers = {
    aws = aws.us-east-1
  }

  enable_auto_accept_shared_attachments = true
  enable_default_route_table_association = true
  vpc_attachments = {
    vpc = {
      vpc_id = data.terraform_remote_state.us_east_1_prod_main_remote.outputs.vpc_id
      subnet_ids = data.terraform_remote_state.us_east_1_prod_main_remote.outputs.vpc_private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = data.terraform_remote_state.us_east_1_prod_main_remote.outputs.vpc_cidr
        }
      ]
    }
  }

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    {
    Name = "us-east-1-main-tgw"
    },
  )

}
