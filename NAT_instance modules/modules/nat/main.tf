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

resource "aws_instance" "nat" {
  ami                         = var.ami_nat
  instance_type               = var.instance_type_nat
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  source_dest_check           = false
  associate_public_ip_address = true
  user_data                   = var.nat_script

  tags = {
    Name       = "${var.client_name}-Instance"
    Managed_by = var.managed_by
  }
}


resource "aws_route" "rt_update" {
  route_table_id = var.private_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_instance.nat.primary_network_interface_id
}