resource "aws_vpc_endpoint" "ap_southeast_1_uberads_vpc_endpoint_gw" {

  vpc_id = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.ap-southeast-1.s3"
  route_table_ids = flatten([module.vpc.private_route_table_ids])

  tags = merge(
    data.terraform_remote_state.global_prod_uberads_remote.outputs.default_tags,
    {
    Name = "ap-southeast-1-prod-uberads-vpc-endpoint-gw"
    },
  )
}
