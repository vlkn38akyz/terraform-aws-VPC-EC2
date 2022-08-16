variable "aws_vpc_cidr_block" {
    default = "10.0.0.0/16"
  
}

# variable "environment" {
#     default = "volkan"
  
# }

variable "aws_public_subnet_cidr_block" {
    default = "10.0.2.0/24"
  
}


variable "aws_private_subnet_cidr_block" {
    default = "10.0.1.0/24"
  
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}


variable "tag" {
  type = string
  default = "VPC-Instance"
}
# variable "aws_ami" {
#     default = "ami-090fa75af13c156b4"
  
# }

variable "num_of_instance" {
  type = number
  default = 1
}

variable "VPC-EC2-ports" {
  type = list(number)
  description = "VPC-EC2-sec-gr-inbound-rules"
  default = [22, 80, 8080]
}