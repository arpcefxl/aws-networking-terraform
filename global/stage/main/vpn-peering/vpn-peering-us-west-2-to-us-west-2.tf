resource "aws_vpc_peering_connection" "us_west_2_2" {

  provider    = aws.us-west-2
  peer_vpc_id = data.terraform_remote_state.global_remote.outputs.nearam_vpn_west_vpcid
  vpc_id      = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_id
  auto_accept = true

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "vpn-1-to-stage-main-us-west-2"
    },
  )

}

module "us_west_2_2_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.us-west-2
  }

  source_region                   = "us-west-2"
  destination_region              = "us-west-2"
  vpc_peering_connection_id       = aws_vpc_peering_connection.us_west_2_2.id
  source_cidr                     = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.global_remote.outputs.nearam_vpn_west_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.global_remote.outputs.nearam_vpn_west_rtid

}

