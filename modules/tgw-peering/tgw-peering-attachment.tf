resource "aws_ec2_transit_gateway_peering_attachment" "tgw_peering_attachment" {

  transit_gateway_id      = var.source_tgw_id
  peer_region             = var.destination_region
  peer_transit_gateway_id = var.destination_tgw_id
  tags = merge(
    var.tags_to_apply,
    {
      Name = "${var.source_region}-to-${var.destination_region}"
    },
  )

}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "tgw_peer_accepter" {
  provider = aws.destination-region
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.tgw_peering_attachment.id
}
