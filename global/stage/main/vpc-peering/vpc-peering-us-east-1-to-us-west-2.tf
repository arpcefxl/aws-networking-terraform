resource "aws_vpc_peering_connection" "us_east_1_to_us_west_2" {

  provider    = aws.us-east-1
  peer_vpc_id = data.terraform_remote_state.us_west_2_stage_main_remote.outputs.vpc_id
  vpc_id      = data.terraform_remote_state.us_east_1_stage_main_remote.outputs.vpc_id
  auto_accept = false
  peer_region = "us-west-2"

#  requester {
#    allow_remote_vpc_dns_resolution = true
#  }
  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "stage-main-us-east-1-to-us-west-2"
    },
  )

}

resource "aws_vpc_peering_connection_accepter" "us_east_1_to_us_west_2_accepter" {
  provider                  = aws.us-west-2
  vpc_peering_connection_id = aws_vpc_peering_connection.us_east_1_to_us_west_2.id
  auto_accept               = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "stage-main-us-east-1-to-us-west-2-accepter"
    },
  )
}

module "us_east_1_to_us_west_2_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.us-east-1
  }

  source_region                   = "us-east-1"
  destination_region              = "us-west-2"
  vpc_peering_connection_id       = aws_vpc_peering_connection.us_east_1_to_us_west_2.id
  source_cidr                     = data.terraform_remote_state.us_east_1_stage_main_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.us_west_2_stage_main_remote.outputs.vpc_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.us_east_1_stage_main_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.us_west_2_stage_main_remote.outputs.vpc_private_route_table_ids

}

