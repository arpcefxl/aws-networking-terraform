module "ap_east_1_to_ap_southeast_1" {
  source  = "../../modules/tgw-peering"

  providers = {
    aws = aws.ap-east-1
  }

  name                            = "ap-east-1-to-ap-southeast-1"
  source_region                   = "ap-east-1"
  destination_region              = "ap-southeast-1"
  source_tgw_id                   = module.ap_east_1_tgw.ec2_transit_gateway_id
  destination_tgw_id              = module.ap_southeast_1_tgw.ec2_transit_gateway_id
  source_cidr                     = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.ap_east_1_vpc_cidr
  destination_cidr                = data.terraform_remote_state.ap_southeast_1_uberads_remote.outputs.ap_southeast_1_vpc_cidr
  source_route_table_id           = module.ap_east_1_tgw.ec2_transit_gateway_association_default_route_table_id
  destination_route_table_id      = module.ap_southeast_1_tgw.ec2_transit_gateway_association_default_route_table_id
  source_vpc_route_table_ids      = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.ap_east_1_vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.ap_southeast_1_uberads_remote.outputs.ap_southeast_1_vpc_private_route_table_ids
  tags_to_apply                   = var.default_tags

}
