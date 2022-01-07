output "existing_mdbcache_instances" {
  value = var.existing_mdbcache_instances
  description = "all mdbcache instances in existing regional networks"
}

output "existing_rmqexqu_instances" {
  value = var.existing_rmqexqu_instances
  description = "all rmqexqu instances in existing regional networks"
}

output "default_tags" {
  value = var.default_tags
  description = "default tags for all uberads network resources"
}
