variable "vpc_cidr" {
  default = "10.106.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["ap-east-1a", "ap-east-1b", "ap-east-1c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.106.0.0/20", "10.106.16.0/20", "10.106.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.106.128.0/20", "10.106.144.0/20", "10.106.160.0/20"]
  type = list (string)
}

variable "primary_az" {
  default = "ap-east-1a"
}
