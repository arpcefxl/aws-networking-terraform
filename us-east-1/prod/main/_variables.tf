variable "vpc_cidr" {
  default = "10.101.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["us-east-1b", "us-east-1c", "us-east-1d"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.101.0.0/20", "10.101.16.0/20", "10.101.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.101.128.0/20", "10.101.144.0/20", "10.101.160.0/20"]
  type = list (string)
}
