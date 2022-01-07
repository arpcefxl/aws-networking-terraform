variable "default_tags" {
  default = {
    CostCenter = "fnd-core"
    vertical = "fnd"
    ManagedBy = "Terraform"
    resourcegroup = "prod-main-network"
    environment = "prod"
  }
  type = map(string)
}

variable "existing_mdbcache_instances" {
  default = [
    "13.229.235.244/32",
    "52.221.220.205/32",
    "3.120.187.189/32",
    "34.229.66.124/32",
    "3.85.33.63/32",
    "54.219.211.62/32",
    "50.18.27.225/32",
    "13.52.26.25/32"
  ]
  type = list(string)
}

variable "existing_rmqexqu_instances" {
  default = [
    "13.57.12.122/32",
    "54.193.41.56/32",
    "35.174.211.31/32",
    "52.86.109.1/32",
    "13.229.132.141/32",
    "13.229.184.105/32",
    "54.93.194.222/32",
    "18.196.157.33/32"
  ]
}
