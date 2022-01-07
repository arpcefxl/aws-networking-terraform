variable "default_tags" {
  default = {
    CostCenter = "fnd-core"
    vertical = "fnd"
    ManagedBy = "Terraform"
    resourcegroup = "stage-main-network"
    environment = "stage"
    for-use-with-amazon-emr-managed-policies = "true"
  }
  type = map(string)
}

variable "existing_mdbcache_instances" {
  default = [
    "50.112.166.59/32"
  ]
  type = list(string)
}

variable "existing_rmqexqu_instances" {
  default = [
    "54.244.212.86/32"
  ]
}
