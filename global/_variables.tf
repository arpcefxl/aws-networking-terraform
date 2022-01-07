variable "nearam_vpn" {
  description = "Near Americas OpenVPN Endpoints"
  default     = ["52.205.18.48/32", "52.39.103.57/32", "10.255.3.103/32", "10.254.1.119/32"]
}

variable "nearam_vpn_east_vpcid" {
  default = "vpc-06d5abd9137a1fcda"
  type = string
}

variable "nearam_vpn_east_rtid" {
  default = ["rtb-0f81f92bb5e9225fb"]
}

variable "nearam_vpn_east_cidr" {
  default = "10.255.0.0/16"
}

variable "nearam_vpn_west_vpcid" {
  default = "vpc-0bd6b4e4eb4c11e95"
  type = string
}

variable "nearam_vpn_west_rtid" {
  default = ["rtb-034701fff93eea17e"]
}

variable "nearam_vpn_west_cidr" {
  default = "10.254.0.0/16"
}

