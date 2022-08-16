A new VPC will be created. Two subnets, one public and one private, will be created within this VPC.

Terraform Module for provisioning an AWS EC2 inside the public subnet. The "userdata" added to the EC2 to be created will be run.


Not intended for production use. It is an example module.

It is just to show how to create a publish module in Terraform Registry.

Usage:

```hcl

provider "aws" {
  region = "us-east-1"
}

module "VPC_EC2" {
    source = "vlkn38akyz/VPC_EC2/aws"
    key_name = "clarusway"
}