variable "name" {
  type = string
  default = "me"
}

variable "source_region" {
  type = string
  default = ""
}

variable "environment" {
  type = string
  default = ""
}

variable "vpc_id" {
  type = string
  default = ""
}

variable "local_vpc_cidr" {
  type = string
  default = ""
}

variable "remote_vpc_cidr" {
  type = list(string)
  default = ["192.168.0.0/24"]
}

variable "vpn_cidr" {
  type = list(string)
  default = []
}

variable "existing_mdbcache_instances" {
  type = list(string)
  default = []
}

variable "existing_rmqexqu_instances" {
  type = list(string)
  default = []
}

variable "mongodb_cidr" {
  type = list(string)
  default = []
}

variable "tags_to_apply" {
  default = {}
  type = map(string)
}
