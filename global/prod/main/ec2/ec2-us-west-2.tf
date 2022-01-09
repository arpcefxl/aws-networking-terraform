resource "aws_instance" "us_west_2_ec2" {
  provider    = aws.us-west-2
  ami           = "${data.aws_ami.amazonlinux2_us_west_2.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${module.us_west_2_security_group.security_group_id}"]
  subnet_id              = data.terraform_remote_state.us_west_2_main_prod_remote.outputs.vpc_private_subnets[0]
  iam_instance_profile   = aws_iam_instance_profile.ec2_demo_instance_profile.name

  tags = merge(
    data.terraform_remote_state.global_prod_main_remote.outputs.default_tags,
    {
    Name = "us-west-2-ec2"
    }
  )
}

module "us_west_2_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  providers = {
    aws = aws.us-west-2
  }
  name               = "us-west-2-security-group"
  description        = "test security group"
  vpc_id             = data.terraform_remote_state.us_west_2_main_prod_remote.outputs.vpc_id
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "10.101.0.0/16"
    },
    {
      rule        = "all-all"
      cidr_blocks = "10.106.0.0/16"
    },
  ]
}
