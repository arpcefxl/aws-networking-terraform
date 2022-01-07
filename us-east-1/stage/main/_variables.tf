variable "vpc_cidr" {
  default = "10.151.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["us-east-1b", "us-east-1c", "us-east-1d"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.151.0.0/20", "10.151.16.0/20", "10.151.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.151.128.0/20", "10.151.144.0/20", "10.151.160.0/20"]
  type = list (string)
}

variable "mongodb_cidr" {
  default = ["10.151.143.252/30", "10.151.159.252/30", "10.151.175.252/30"]
  type = list (string)
}
