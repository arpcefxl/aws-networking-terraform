resource "aws_vpc_endpoint" "us_west_2_main_vpc_endpoint_gw" {

  vpc_id = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.us-west-2.s3"
  route_table_ids = flatten([module.vpc.private_route_table_ids])

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    {
    Name = "us-west-2-prod-main-vpc-endpoint-gw"
    },
  )
}
