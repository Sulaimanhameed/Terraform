# 1. AWS VPC (Virtual Private Cloud)

resource "aws_vpc" "nat-vpc" {
  cidr_block       = var.vpc_cidr_block
  

tags = {
    Name       = "${var.client_name}-VPC"
    Managed_by = "${var.managed_by}"
  }
}

# 2. AWS Internet Gateway (IGW)

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.nat-vpc.id

tags = {
    Name       = "${var.client_name}-INTERNET-GATEWAY"
    Managed_by = "${var.managed_by}"
  }
}

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

# 5. AWS Public Route table

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
# 6. awsPrivate Route Table
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
# 9. AWS public Security Group 

resource "aws_security_group" "pub-SG" {
  name        = "${var.client_name}-PUB-SG"
#   description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.nat-vpc.id

ingress {
    from_port        = var.public_sg_in_from_port
    to_port          = var.public_sg_in_to_port
    protocol         = var.public_sg_in_protocol
    cidr_blocks      = var.public_sg_in_cidr_blocks
    
  }
egress {
    from_port        = var.common_sg_eg_from_prot
    to_port          = var.common_sg_eg_to_prot
    protocol         = var.common_sg_eg_protocol
    cidr_blocks      = var.common_sg_eg_cidr_blocks
    
  }

  tags = {
    Name       = "${var.client_name}-PUB-SG"
    Managed_by = "${var.managed_by}"
  }
}
# 10.AWS private security group 

resource "aws_security_group" "pvt-SG" {
  name        = "${var.client_name}-PVT-SG"
#   description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.nat-vpc.id

ingress {
    from_port        = var.private_sg_in_22_from_port
    to_port          = var.private_sg_in_22_to_port
    protocol         = var.private_sg_in_22_protocol
    cidr_blocks      = var.private_sg_in_22_cidr_blocks
  }
ingress {
    from_port   = var.pvivate_sg_in_80_from_port
    to_port     = var.private_sg_in_80_to_port
    protocol    = var.private_sg_in_80_protocol
    cidr_blocks = var.private_sg_in_80_cidr_blocks
}   
egress {
    from_port        = var.common_sg_eg_from_prot
    to_port          = var.common_sg_eg_to_prot
    protocol         = var.common_sg_eg_protocol
    cidr_blocks      = var.common_sg_eg_cidr_blocks
    
  }
  tags = {
    Name       = "${var.client_name}-PVT-SG"
    Managed_by = "${var.managed_by}"
  }
}
# 11. AWS EC2 - Web1 (Public Subnet 1)
resource "aws_instance" "pub-vm" {
  ami                         = var.ami
  instance_type               = var.my-instance-type
  subnet_id                   = aws_subnet.pub-subnet.id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.pub-SG.id]
  

  tags = {
    Name       = "${var.client_name}-PUB-VM"
    Managed_by = "${var.managed_by}"
  }
}

# 12. AWS EC2  (Private Subnet 1)
resource "aws_instance" "pvt-vm" {
  ami               = var.ami
  instance_type     = var.my-instance-type
  subnet_id         = aws_subnet.pvt-subnet.id
  key_name          = var.key_name
  
  vpc_security_group_ids = [aws_security_group.pvt-SG.id]


  tags = {
    Name       = "${var.client_name}-PVT_VM"
    Managed_by = "${var.managed_by}"
  }
}
