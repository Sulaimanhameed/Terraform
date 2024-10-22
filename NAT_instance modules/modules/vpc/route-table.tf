#  AWS Public Route table

resource "aws_route_table" "pub-RT" {
  vpc_id = aws_vpc.nat-vpc.id

  route {
    cidr_block = var.internet_gatewys_rt_add_destination_cidr_block
    gateway_id = aws_internet_gateway.igw-1.id
  }
  tags = {
    Name       = "${var.client_name}-PUB-RT"
    Managed_by = "${var.managed_by}"
  }
}
# awsPrivate Route Table
resource "aws_route_table" "pvt-RT" {
  vpc_id = aws_vpc.nat-vpc.id

  tags = {
    Name       = "${var.client_name}-PVT-RT"
    Managed_by = var.managed_by
  }
}

# 7. AWS Public Route table 1 association with Public Subnet 
resource "aws_route_table_association" "asso-pub-subnet-rt" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.pub-RT.id
}
# 8. AWS Private Route table 1 association with Private Subnet 1
resource "aws_route_table_association" "asso-pvt-subnet-rt" {
  subnet_id      = aws_subnet.pvt-subnet.id
  route_table_id = aws_route_table.pvt-RT.id
}