module "consl" {
  source = "terraform-aws-modules/security-group/aws"

  name               = "${var.source_region}-${var.environment}-${var.name}-consl"
  description        = "log consumer instances"
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
      from_port   = 9001
      to_port     = 9001
      protocol    = 6
      description = "tcp 9001"
      cidr_blocks = var.local_vpc_cidr
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      from_port   = 9001
      to_port     = 9001
      protocol    = 6
      description = "tcp 9001"
      cidr_blocks = join(",", var.vpn_cidr)
    },
  ]

  tags = var.tags_to_apply

}
