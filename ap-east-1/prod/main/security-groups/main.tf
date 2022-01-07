module "ap_east_1_security_groups" {
  source  = "../../../../modules/security-groups/uberads"

  name            = "uberads"
  source_region   = "ap-east-1"
  environment     = "prod"
  vpc_id          = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.vpc_id
  local_vpc_cidr  = data.terraform_remote_state.ap_east_1_uberads_remote.outputs.vpc_cidr
  remote_vpc_cidr = [
    data.terraform_remote_state.eu_central_1_uberads_remote.outputs.vpc_cidr,
    data.terraform_remote_state.ap_southeast_1_uberads_remote.outputs.vpc_cidr,
    data.terraform_remote_state.us_east_1_uberads_remote.outputs.vpc_cidr
  ]
  vpn_cidr        = data.terraform_remote_state.global_remote.outputs.nearam_vpn
  existing_mdbcache_instances = data.terraform_remote_state.global_prod_uberads_remote.outputs.existing_mdbcache_instances
  existing_rmqexqu_instances = data.terraform_remote_state.global_prod_uberads_remote.outputs.existing_rmqexqu_instances
  mongodb_cidr    = concat(data.terraform_remote_state.us_east_1_uberads_remote.outputs.vpc_mongodb_cidr, data.terraform_remote_state.ap_southeast_1_uberads_remote.outputs.vpc_mongodb_cidr, data.terraform_remote_state.eu_central_1_uberads_remote.outputs.vpc_mongodb_cidr)
  tags_to_apply   = data.terraform_remote_state.global_prod_uberads_remote.outputs.default_tags

}
