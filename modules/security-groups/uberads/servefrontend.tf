module "servefrontend" {
  source = "terraform-aws-modules/security-group/aws"

  name               = "${var.source_region}-${var.environment}-${var.name}-servefrontend"
  description        = "servefrontend nginx instances"
  vpc_id             = var.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_with_source_security_group_id = [
    {
      rule        = "all-all"
      source_security_group_id = module.cnc.security_group_id
    }
  ]
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = "${var.local_vpc_cidr}"
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    }
  ]
  tags = var.tags_to_apply

}
