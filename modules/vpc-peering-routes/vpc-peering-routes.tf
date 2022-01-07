resource "aws_route" "vpc_route_source" {
  for_each = toset(var.source_vpc_route_table_ids)
  route_table_id            = each.value
  destination_cidr_block    = var.destination_cidr
  vpc_peering_connection_id = var.vpc_peering_connection_id
}

resource "aws_route" "vpc_route_destination" {
  provider = aws.destination-region
  for_each = toset(var.destination_vpc_route_table_ids)
  route_table_id            = each.value
  destination_cidr_block    = var.source_cidr
  vpc_peering_connection_id = var.vpc_peering_connection_id
}

