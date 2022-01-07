variable "existing_vpc_routes" {
  default = ["rtb-c9f96bae", "rtb-077afa22035e3c25f"]
  type = list (string)
}
variable "existing_vpc_cidr_block" {
  default = "172.31.0.0/16"
  type = string
}
