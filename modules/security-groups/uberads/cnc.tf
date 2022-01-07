module "cnc" {
  source = "terraform-aws-modules/security-group/aws"

  name               = "${var.source_region}-${var.environment}-${var.name}-cnc"
  description        = "cnc, infrastructure and monitoring instances"
  vpc_id             = var.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_with_self  = [
    {
      rule        = "all-all"
    }
  ]
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      rule        = "http-80-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    }
  ]

  tags = var.tags_to_apply

}
