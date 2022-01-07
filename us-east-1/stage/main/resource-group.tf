resource "aws_resourcegroups_group" "stage_main_network" {
  name = "stage-main-network"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::AllSupported"
  ],
  "TagFilters": [
    {
      "Key": "resourcegroup",
      "Values": ["stage-main-network"]
    }
  ]
}
JSON
  }
}
