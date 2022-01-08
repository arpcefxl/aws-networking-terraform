variable "default_tags" {
  default = {
    costcenter = "demo"
    ManagedBy = "Terraform"
    environment = "prod"
  }
  type = map(string)
}
