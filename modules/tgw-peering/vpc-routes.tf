resource "aws_route" "vpc_route_source" {
  provider = aws.source-region
  for_each = toset(var.source_vpc_route_table_ids)
  route_table_id            = each.value
  destination_cidr_block = var.destination_cidr
  transit_gateway_id = var.source_tgw_id
}

resource "aws_route" "vpc_route_destination" {
  provider = aws.destination-region
  for_each = toset(var.destination_vpc_route_table_ids)
  route_table_id            = each.value
  destination_cidr_block = var.source_cidr
  transit_gateway_id = var.destination_tgw_id
}

