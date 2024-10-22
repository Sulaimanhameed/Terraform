# AWS public Security Group 

resource "aws_security_group" "pub-SG" {
  name = "${var.client_name}-PUB-SG"
  #   description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = data.aws_vpc.nat-vpc

  ingress {
    from_port   = var.public_sg_in_from_port
    to_port     = var.public_sg_in_to_port
    protocol    = var.public_sg_in_protocol
    cidr_blocks = var.public_sg_in_cidr_blocks

  }
  egress {
    from_port   = var.common_sg_eg_from_prot
    to_port     = var.common_sg_eg_to_prot
    protocol    = var.common_sg_eg_protocol
    cidr_blocks = var.common_sg_eg_cidr_blocks

  }

  tags = {
    Name       = "${var.client_name}-PUB-SG"
    Managed_by = "${var.managed_by}"
  }
}
# AWS private security group 

resource "aws_security_group" "pvt-SG" {
  name = "${var.client_name}-PVT-SG"
  #   description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = data.aws_vpc.nat-vpc

  ingress {
    from_port   = var.private_sg_in_22_from_port
    to_port     = var.private_sg_in_22_to_port
    protocol    = var.private_sg_in_22_protocol
    cidr_blocks = var.private_sg_in_22_cidr_blocks
  }
  ingress {
    from_port   = var.private_sg_in_80_from_port
    to_port     = var.private_sg_in_80_to_port
    protocol    = var.private_sg_in_80_protocol
    cidr_blocks = var.private_sg_in_80_cidr_blocks
  }
  egress {
    from_port   = var.common_sg_eg_from_prot
    to_port     = var.common_sg_eg_to_prot
    protocol    = var.common_sg_eg_protocol
    cidr_blocks = var.common_sg_eg_cidr_blocks

  }
  tags = {
    Name       = "${var.client_name}-PVT-SG"
    Managed_by = "${var.managed_by}"
  }
}
#####################################################################
data "aws_vpc" "nat-vpc" {
  id = aws_vpc.nat-vpc
  
}