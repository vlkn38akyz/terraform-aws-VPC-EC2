

resource "aws_subnet" "public_subnet" {
  cidr_block = var.aws_public_subnet_cidr_block
  vpc_id = aws_vpc.module_vpc.id
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public_subnet_${var.tag}"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block =  var.aws_private_subnet_cidr_block
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = "terraform_private_subnet_${var.tag}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table" "route_terraform" {
  vpc_id = aws_vpc.module_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "terraform-public-${var.tag}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_terraform.id
}


