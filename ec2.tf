data "aws_ami" "amazon-linux-2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}

# data "template_file" "userdata" {
#   template = file("${abspath(path.module)}/userdata.sh")
#   vars = {
#     server-name = var.server-name
#   }
# }


resource "aws_vpc" "module_vpc" {
  cidr_block  = var.aws_vpc_cidr_block

  tags = {
    Name = "terraform-vpc-${var.tag}"
  }
}


resource "aws_instance" "tfmyec2" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.public_subnet.id
   #user_data = file("user_data.sh")
   user_data = file("${path.module}/user_data.sh")
  vpc_security_group_ids = [ aws_security_group.tf-sg.id ]
  

  tags = {
    Name = var.tag
  }
}

resource "aws_security_group" "tf-sg" {
  name        = "${var.tag}-terrafform-sec-grp"
   tags = {
    Name = var.tag
  }
  vpc_id = aws_vpc.module_vpc.id

  dynamic "ingress" {
    for_each = var.VPC-EC2-ports
    iterator = port
    content {
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 
}

