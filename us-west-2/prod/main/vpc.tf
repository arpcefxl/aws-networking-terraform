resource "aws_eip" "nat" {
  count = length(var.availability_zones)
  vpc = true
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "us-west-2-prod-main-vpc"
  cidr = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  azs = var.availability_zones
  public_subnets = var.public_subnet_cidr
  public_subnet_suffix = "public-subnet"
  private_subnets  = var.private_subnet_cidr
  private_subnet_suffix = "private-subnet"
  enable_nat_gateway = true
  single_nat_gateway = false
  reuse_nat_ips = true  
  external_nat_ip_ids = "${aws_eip.nat.*.id}"
  tags = data.terraform_remote_state.global_prod_main_remote.outputs.default_tags
}
