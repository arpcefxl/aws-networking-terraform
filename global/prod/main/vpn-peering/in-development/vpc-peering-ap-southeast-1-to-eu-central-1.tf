resource "aws_vpc_peering_connection" "ap_southeast_1_to_eu_central_1" {

  provider    = aws.ap-southeast-1
  peer_vpc_id = data.terraform_remote_state.eu_central_1_uberads_prod_remote.outputs.vpc_id
  vpc_id      = data.terraform_remote_state.ap_southeast_1_uberads_prod_remote.outputs.vpc_id
  auto_accept = false
  peer_region = "eu-central-1"

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_prod_uberads_remote.outputs.default_tags,
    {
    Name = "prod-uberads-ap-southeast-1-to-eu-central-1"
    },
  )

}

resource "aws_vpc_peering_connection_accepter" "ap_southeast_1_to_eu_central_1_accepter" {
  provider                  = aws.eu-central-1
  vpc_peering_connection_id = aws_vpc_peering_connection.ap_southeast_1_to_eu_central_1.id
  auto_accept               = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    data.terraform_remote_state.global_prod_uberads_remote.outputs.default_tags,
    {
    Name = "prod-uberads-ap-southeast-1-to-eu-central-1-accepter"
    },
  )
}

module "ap_southeast_1_to_eu_central_1_routes" {
  source  = "../../../../modules/vpc-peering-routes"

  providers = {
    aws = aws.ap-southeast-1
  }

  source_region                   = "ap-southeast-1"
  destination_region              = "eu-central-1"
  vpc_peering_connection_id       = aws_vpc_peering_connection.ap_southeast_1_to_eu_central_1.id
  source_cidr                     = data.terraform_remote_state.ap_southeast_1_uberads_prod_remote.outputs.vpc_cidr
  destination_cidr                = data.terraform_remote_state.eu_central_1_uberads_prod_remote.outputs.vpc_cidr
  source_vpc_route_table_ids      = data.terraform_remote_state.ap_southeast_1_uberads_prod_remote.outputs.vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.eu_central_1_uberads_prod_remote.outputs.vpc_private_route_table_ids

}

