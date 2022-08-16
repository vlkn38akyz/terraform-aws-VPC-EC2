output "vpc_id" {
    value = aws_vpc.module_vpc.id
  
}

output "vpc_cidr" {
    value = aws_vpc.module_vpc.cidr_block
  
}

output "public_subnet_cidr" {
    value = aws_subnet.public_subnet.cidr_block
  
}

output "privat_subnet_cidr" {
    value = aws_subnet.private_subnet.cidr_block
  
}


output "instance_public_ip" {
  value = aws_instance.tfmyec2.*.public_ip
}

output "sec_gr_id" {
  value = aws_security_group.tf-sg.id
}

output "instance_id" {
  value = aws_instance.tfmyec2.*.id
}
