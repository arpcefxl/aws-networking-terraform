variable "existing_vpc_routes" {
  default = ["rtb-41ecdb24"]
  type = list (string)
}
variable "existing_vpc_cidr_block" {
  default = "10.0.0.0/16"
  type = string
}
