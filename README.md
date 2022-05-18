# aws-networking-terraform
## Deployment does require a specific order
## perform terraform init/plan/apply in these directories
## Required:
#### global
#### global/prod/main

### (any of the following three in any order)
#### us-east-1/prod/main
#### us-west-2/prod/main
#### ap-east-1/prod/main

### You then have a choice of transit-gateway or VPC peering
You may test both, just make sure you destroy one before deploying the other
#### global/prod/main/vpc-peering
### OR
#### global/prod/main/transit-gateway-peering

### You may optionally deploy EC2 instances for testing
### Make sure to change the key_pair to an appropriate value
#### global/prod/main/ec2

# Cleanup is "terraform destroy" in the reverse directory order of deployment
