# provider "aws" {
#   region = var.region
# }

#  AWS EC2 (Public Instance)
resource "aws_instance" "pub-vm" {
  ami                         = var.ami
  instance_type               = var.my-instance-type
  subnet_id                   = data.aws_subnet.pub-subnet.id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.pub-SG.id]


  tags = {
    Name       = "${var.client_name}-PUB-VM"
    Managed_by = "${var.managed_by}"
  }
}

# AWS EC2  (Private Instance)
resource "aws_instance" "pvt-vm" {

  ami           = var.ami
  instance_type = var.my-instance-type
  subnet_id     = data.aws_subnet.pvt-subnet
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.pvt-SG.id]


  tags = {
    Name       = "${var.client_name}-PVT_VM"
    Managed_by = "${var.managed_by}"
  }
}

########################################################################

data "aws_subnet" "pub-subnet" {
  id = aws_subnet.pub-subnet
}
data "aws_subnet" "pvt-subnet" {
  id = aws_subnet.pvt-subnet
  
}
