# 1. AWS VPC (Virtual Private Cloud)

resource "aws_vpc" "nat-vpc" {
  cidr_block = var.vpc_cidr_block


  tags = {
    Name       = "${var.client_name}-VPC"
    Managed_by = "${var.managed_by}"
  }
}
data "aws_vpc" "nat-vpc" {
  id = aws_vpc.nat-vpc.id
  
}