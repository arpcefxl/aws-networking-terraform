resource "aws_vpc_peering_connection" "us_east_1_1" {

  provider    = aws.us-east-1
  peer_vpc_id = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_vpcid
  vpc_id      = data.terraform_remote_state.us_east_1_main_stage_remote.outputs.vpc_id
  auto_accept = true

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "vpn-1-to-stage-main-us-east-1"
    },
  )

}

module "us_east_1_1_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.us-east-1
  }

  source_region                   = "us-east-1"
  destination_region              = "us-east-1"
  vpc_peering_connection_id       = aws_vpc_peering_connection.us_east_1_1.id
  source_cidr                     = data.terraform_remote_state.us_east_1_main_stage_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.us_east_1_main_stage_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_rtid

}

