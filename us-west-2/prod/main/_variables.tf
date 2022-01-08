variable "vpc_cidr" {
  default = "10.103.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.103.0.0/20", "10.103.16.0/20", "10.103.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.103.128.0/20", "10.103.144.0/20", "10.103.160.0/20"]
  type = list (string)
}
