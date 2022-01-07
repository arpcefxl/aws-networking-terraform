resource "aws_ec2_transit_gateway_route" "tgw_route_source" {
  provider = aws.source-region
  destination_cidr_block = var.destination_cidr
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgw_peering_attachment.id
  transit_gateway_route_table_id = var.source_route_table_id
}

resource "aws_ec2_transit_gateway_route" "tgw_route_destination" {
  provider = aws.destination-region
  destination_cidr_block = var.source_cidr
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgw_peering_attachment.id
  transit_gateway_route_table_id = var.destination_route_table_id

}
