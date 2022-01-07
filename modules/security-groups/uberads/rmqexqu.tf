module "rmqexqu" {
  source = "terraform-aws-modules/security-group/aws"

  name               = "${var.source_region}-${var.environment}-${var.name}-rmqexqu"
  description        = "rmqexqu rabbitmq instances"
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
      rule        = "rabbitmq-5671-tcp"
      cidr_blocks = "${var.local_vpc_cidr}"
    },
    {
      rule        = "rabbitmq-5672-tcp"
      cidr_blocks = "${var.local_vpc_cidr}"
    },
    {
      rule        = "rabbitmq-15672-tcp"
      cidr_blocks = "${var.local_vpc_cidr}"
    },
    {
      rule        = "rabbitmq-5671-tcp"
      cidr_blocks = join(",", var.remote_vpc_cidr)
    },
    {
      rule        = "rabbitmq-5672-tcp"
      cidr_blocks = join(",", var.remote_vpc_cidr)
    },
    {
      rule        = "rabbitmq-15672-tcp"
      cidr_blocks = join(",", var.remote_vpc_cidr)
    },
    {
      rule        = "rabbitmq-5671-tcp"
      cidr_blocks = join(",", var.existing_rmqexqu_instances)
    },
    {
      rule        = "rabbitmq-5672-tcp"
      cidr_blocks = join(",", var.existing_rmqexqu_instances)
    },
    {
      rule        = "rabbitmq-15672-tcp"
      cidr_blocks = join(",", var.existing_rmqexqu_instances)
    },
    {
      rule        = "rabbitmq-5671-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      rule        = "rabbitmq-5672-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    },
    {
      rule        = "rabbitmq-15672-tcp"
      cidr_blocks = join(",", var.vpn_cidr)
    }
  ]
  tags = var.tags_to_apply

}
