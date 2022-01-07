variable "existing_vpc_routes" {
  default = ["rtb-a5b6ffce"]
  type = list (string)
}
variable "existing_vpc_cidr_block" {
  default = "10.3.0.0/16"
  type = string
}
