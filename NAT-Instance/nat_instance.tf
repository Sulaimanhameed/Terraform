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
  ami                         = "ami-03455155bfe406fa1"
  instance_type               = "t4g.micro"
  
  subnet_id                   = aws_subnet.pub-subnet.id
  key_name                    = "sulaiman"
  vpc_security_group_ids      = [aws_security_group.pub-SG.id]
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name       = "${var.client_name}-NAT-Instance"
    Managed_by = var.managed_by
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update the system
              yum update -y

              # Install iptables
              yum install -y iptables-services

              # Enable IP forwarding
              echo "net.ipv4.ip_forward = 1" | tee -a /etc/sysctl.conf
              sysctl -p

              # Configure NAT rules
              sudo iptables -t nat -A POSTROUTING -o ens5 -s 10.0.2.0/24 -j MASQUERADE

              # Save iptables rules
              service iptables save

              # Enable iptables service
              systemctl enable iptables
              systemctl start iptables
              EOF
}



output "network_interface_id" {
  value = aws_instance.nat_instance.primary_network_interface_id
}


#  update the route table

resource "aws_route" "update" {
  route_table_id            = aws_route_table.pvt-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  network_interface_id      = aws_instance.nat_instance.primary_network_interface_id
}