module "ap_east_1_to_eu_central_1" {
  source  = "../../modules/tgw-peering"

  providers = {
    aws = aws.ap-east-1
  }

  name                            = "ap-east-1-to-eu-central-1"
  source_region                   = "ap-east-1"
  destination_region              = "eu-central-1"
  source_tgw_id                   = module.ap_east_1_tgw.ec2_transit_gateway_id
  destination_tgw_id              = module.eu_central_1_tgw.ec2_transit_gateway_id
  source_cidr                     = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.ap_east_1_vpc_cidr
  destination_cidr                = data.terraform_remote_state.eu_central_1_uberads_remote.outputs.eu_central_1_vpc_cidr
  source_route_table_id           = module.ap_east_1_tgw.ec2_transit_gateway_association_default_route_table_id
  destination_route_table_id      = module.eu_central_1_tgw.ec2_transit_gateway_association_default_route_table_id
  source_vpc_route_table_ids      = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.ap_east_1_vpc_private_route_table_ids
  destination_vpc_route_table_ids = data.terraform_remote_state.eu_central_1_uberads_remote.outputs.eu_central_1_vpc_private_route_table_ids
  tags_to_apply                   = var.default_tags

}
