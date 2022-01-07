variable "source_region" {
  type = string
  default = "us-east-1"
}

variable "destination_region" {
  type = string
  default = "ap-east-1"
}

variable "vpc_peering_connection_id" {
  type = string
  default = "default"
}

variable "source_cidr" {
  type = string
  default = "10.255.0.0/16"
}

variable "destination_cidr" {
  type = string
  default = "10.255.0.0/16"
}

variable "source_vpc_route_table_ids" {
  type = list
  default = []
}

variable "destination_vpc_route_table_ids" {
  type = list
  default = []
}
