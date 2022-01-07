resource "aws_resourcegroups_group" "uberads_prod_network" {
  name = "uberads-prod-network"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "resourcegroup",
      "Values": ["uberads-prod-network"]
    }
  ]
}
JSON
  }
}
