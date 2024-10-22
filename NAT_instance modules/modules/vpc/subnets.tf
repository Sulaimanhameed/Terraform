# 3. AWS Public Subnet 

resource "aws_subnet" "pub-subnet" {
  vpc_id     = aws_vpc.nat-vpc.id
  cidr_block = var.public_subnet_cidr_blocks
  tags = {
    Name       = "${var.client_name}-PUB_SUBNET"
    Managed_by = "${var.managed_by}"
  }
}

# 4. AWS Private Subnet 

resource "aws_subnet" "pvt-subnet" {
  vpc_id     = aws_vpc.nat-vpc.id
  cidr_block = var.private_subnet_cidr_blocks

  tags = {
    Name       = "${var.client_name}-PVT_SUBNET"
    Managed_by = "${var.managed_by}"
  }
}


data "aws_subnet" "pub-subnet" {
  id = aws_subnet.pub-subnet
}
data "aws_subnet" "pvt-subnet" {
  id = aws_subnet.pvt-subnet
  
}