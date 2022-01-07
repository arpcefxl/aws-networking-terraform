variable "existing_vpc_routes" {
  default = ["rtb-bfdac9dd", "rtb-0c7433af5320b8342"]
  type = list (string)
}
variable "existing_vpc_cidr_block" {
  default = "10.1.0.0/16"
  type = string
}
