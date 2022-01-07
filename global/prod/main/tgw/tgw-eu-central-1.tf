module "eu_central_1_tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  name    = "eu-central-1-uberads-tgw"

  providers = {
    aws = aws.eu-central-1
  }

  enable_auto_accept_shared_attachments = true
  enable_default_route_table_association = true
  vpc_attachments = {
    vpc = {
      vpc_id = data.terraform_remote_state.eu_central_1_uberads_remote.outputs.eu_central_1_vpc_id
      subnet_ids = data.terraform_remote_state.eu_central_1_uberads_remote.outputs.eu_central_1_vpc_private_subnets
      dns_support = true

      tgw_routes = [
        {
          destination_cidr_block = data.terraform_remote_state.eu_central_1_uberads_remote.outputs.eu_central_1_vpc_cidr
        }
      ]
    }
  }

  tags = var.default_tags
}
