variable "vpc_cidr" {
  default = "10.103.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.103.0.0/20", "10.103.16.0/20", "10.103.32.0/20", "10.103.48.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.103.128.0/20", "10.103.144.0/20", "10.103.160.0/20", "10.103.176.0/20"]
  type = list (string)
}

variable "mongodb_cidr" {
  default = ["10.103.143.252/30", "10.103.159.252/30", "10.103.175.252/30", "10.103.191.252/30"]
  type = list (string)
}
