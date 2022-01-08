output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_private_subnets" {
  value = module.vpc.private_subnets
}

output "vpc_private_route_table_ids" {
  value = module.vpc.private_route_table_ids
}

output "primary_az" {
  value = var.primary_az
}

output "primary_subnet_id" {
  value = module.vpc.private_subnets[0]
}

output "primary_nat_ip" {
  value = aws_eip.nat[0].public_ip
}
