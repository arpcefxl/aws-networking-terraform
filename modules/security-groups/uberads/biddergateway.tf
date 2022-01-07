module "biddergateway" {
  source = "terraform-aws-modules/security-group/aws"

  name               = "${var.source_region}-${var.environment}-${var.name}-biddergateway"
  description        = "bidder gateway instances"
  vpc_id             = var.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_with_source_security_group_id = [
    {
      rule        = "all-all"
      source_security_group_id = module.cnc.security_group_id
    },
    {
      rule        = "http-8080-tcp"
      source_security_group_id = module.biddergateway_alb.security_group_id
    }
  ]
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      rule        = "http-8080-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    }
  ]

  tags = var.tags_to_apply

}
