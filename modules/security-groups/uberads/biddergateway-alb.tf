module "biddergateway_alb" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "${var.source_region}-${var.environment}-${var.name}-biddergateway-alb"
  description         = "bidder gateway application load balancer"
  vpc_id              = var.vpc_id
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  tags                = var.tags_to_apply

}
