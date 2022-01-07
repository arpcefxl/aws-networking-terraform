resource "aws_resourcegroups_group" "prod_main_network" {
  name = "prod-main-network"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "resourcegroup",
      "Values": ["prod-main-network"]
    }
  ]
}
JSON
  }
}
