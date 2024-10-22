# 2. AWS Internet Gateway (IGW)

resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.nat-vpc.id

  tags = {
    Name       = "${var.client_name}-INTERNET-GATEWAY"
    Managed_by = "${var.managed_by}"
  }
}