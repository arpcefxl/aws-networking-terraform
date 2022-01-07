variable "vpc_cidr" {
  default = "10.104.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.104.0.0/20", "10.104.16.0/20", "10.104.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.104.128.0/20", "10.104.144.0/20", "10.104.160.0/20"]
  type = list (string)
}

variable "mongodb_cidr" {
  default = ["10.104.143.252/30", "10.104.159.252/30", "10.104.175.252/30"]
  type = list (string)
}
