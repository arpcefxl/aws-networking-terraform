module "us_west_2_security_groups" {
  source  = "../../../../modules/security-groups/uberads"

  name            = "uberads"
  source_region   = "us-west-2"
  environment     = "stage"
  vpc_id          = data.terraform_remote_state.us_west_2_uberads_remote.outputs.us_west_2_vpc_id
  local_vpc_cidr  = data.terraform_remote_state.us_west_2_uberads_remote.outputs.us_west_2_vpc_cidr
  remote_vpc_cidr = [
    data.terraform_remote_state.us_east_1_uberads_remote.outputs.us_east_1_vpc_cidr
  ]
  vpn_cidr        = data.terraform_remote_state.global_remote.outputs.nearam_vpn
  existing_mdbcache_instances = data.terraform_remote_state.global_stage_uberads_remote.outputs.existing_mdbcache_instances
  existing_rmqexqu_instances = data.terraform_remote_state.global_stage_uberads_remote.outputs.existing_rmqexqu_instances
  mongodb_cidr    = concat(data.terraform_remote_state.us_west_2_uberads_remote.outputs.us_west_2_vpc_mongodb_cidr)
  tags_to_apply   = data.terraform_remote_state.global_stage_uberads_remote.outputs.default_tags

}
