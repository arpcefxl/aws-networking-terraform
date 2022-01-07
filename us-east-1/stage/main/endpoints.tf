resource "aws_vpc_endpoint" "us_east_1_main_vpc_endpoint_gw" {

  vpc_id = module.vpc.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name = "com.amazonaws.us-east-1.s3"
  route_table_ids = flatten([module.vpc.private_route_table_ids])

  tags = merge(
    data.terraform_remote_state.global_stage_main_remote.outputs.default_tags,
    {
    Name = "us-east-1-main-stage-vpc-endpoint-gw"
    },
  )
}
