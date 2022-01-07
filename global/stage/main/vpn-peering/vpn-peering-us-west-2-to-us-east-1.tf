resource "aws_vpc_peering_connection" "us_west_2_1" {

  provider    = aws.us-west-2
  peer_vpc_id = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_vpcid
  vpc_id      = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_id
  peer_region = "us-east-1"
  auto_accept = false

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

resource "aws_vpc_peering_connection_accepter" "us_west_2_1_accepter" {
  provider                  = aws.us-east-1
  vpc_peering_connection_id = aws_vpc_peering_connection.us_west_2_1.id
  auto_accept               = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "stage-main-us-west-2-to-vpn-1-accepter"
    },
  )
}


module "us_west_2_1_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.us-west-2
  }

  source_region                   = "us-west-2"
  destination_region              = "us-east-1"
  vpc_peering_connection_id       = aws_vpc_peering_connection.us_west_2_1.id
  source_cidr                     = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.us_west_2_main_stage_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.global_remote.outputs.nearam_vpn_east_rtid

}

