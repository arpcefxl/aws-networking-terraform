resource "aws_vpc_peering_connection" "us_east_1_main_vpc_peering_existing" {
  peer_vpc_id   = "vpc-cc574da8"
  vpc_id        = data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_id
  auto_accept   = true

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    {
    Name = "us-east-1-prod-main-vpc-peering-existing"
    },
  )

}

resource "aws_route" "vpc_route_existing" {
  for_each = toset(var.existing_vpc_routes)
  route_table_id            = each.value
  destination_cidr_block = data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.us_east_1_main_vpc_peering_existing.id
}

resource "aws_route" "vpc_route_existing_new_vpc" {
  for_each = toset(data.terraform_remote_state.us_east_1_main_prod_remote.outputs.vpc_private_route_table_ids)
  route_table_id            = each.value
  destination_cidr_block = var.existing_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_east_1_main_vpc_peering_existing.id
}
