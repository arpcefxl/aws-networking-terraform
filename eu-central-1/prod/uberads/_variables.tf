variable "vpc_cidr" {
  default = "10.105.0.0/16"
  type = string
}

variable "availability_zones" {
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  type = list(string)
}

variable "public_subnet_cidr" {
  default = ["10.105.0.0/20", "10.105.16.0/20", "10.105.32.0/20"]
  type = list (string)
}

variable "private_subnet_cidr" {
  default = ["10.105.128.0/20", "10.105.144.0/20", "10.105.160.0/20"]
  type = list (string)
}

variable "mongodb_cidr" {
  default = ["10.105.143.252/30", "10.105.159.252/30", "10.105.175.252/30"]
  type = list (string)
}
