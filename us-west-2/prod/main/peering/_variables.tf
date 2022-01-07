variable "existing_vpc_routes" {
  default = ["rtb-0d401b15d152f72db", "rtb-01effa63"]
  type = list (string)
}
variable "existing_vpc_cidr_block" {
  default = "10.0.0.0/16"
  type = string
}
