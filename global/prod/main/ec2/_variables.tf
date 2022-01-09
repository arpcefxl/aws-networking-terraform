variable "key_name" {
  default = "csmithaws"
  type = string
}

variable "instance_type" {
  default = "t3.micro"
  type = string
}

variable "policies_to_attach" {
  default = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
  type = list(string)
}
