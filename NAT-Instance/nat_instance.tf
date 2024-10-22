# Data source for Amazon Linux 2 ARM AMI
data "aws_ami" "nat_instance" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 NAT Instance
resource "aws_instance" "nat_instance" {
  ami                         = var.ami_nat
  instance_type               = var.instance_type_nat
  
  subnet_id                   = aws_subnet.pub-subnet.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.pub-SG.id]
  associate_public_ip_address = var.associate_public_ip_address_nat
  source_dest_check           = var.source_dest_check

  tags = {
    Name       = "${var.client_name}-Instance"
    Managed_by = var.managed_by
  }

  user_data = var.nat_script
}



