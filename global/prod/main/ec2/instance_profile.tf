resource "aws_iam_role" "ec2_demo_iam_role" {
  name = "ec2-demo-iam-role"

  tags = data.terraform_remote_state.global_prod_main_remote.outputs.default_tags

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_demo_instance_profile" {
  name = "ec2-demo-instance-profile"
  role = aws_iam_role.ec2_demo_iam_role.name
}

resource "aws_iam_role_policy_attachment" "ec2_demo_role_global_policy_attachment" {
  for_each = toset(var.policies_to_attach)
  role = aws_iam_role.ec2_demo_iam_role.name
  policy_arn = each.value
}
