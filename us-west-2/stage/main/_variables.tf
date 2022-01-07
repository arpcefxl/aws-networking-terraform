variable "vpc_cidr" {
  default = "10.150.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.150.0.0/20", "10.150.16.0/20", "10.150.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.150.128.0/20", "10.150.144.0/20", "10.150.160.0/20"]
  type = list (string)
}

variable "mongodb_cidr" {
  default = ["10.150.143.252/30", "10.150.159.252/30", "10.150.175.252/30"]
  type = list (string)
}
