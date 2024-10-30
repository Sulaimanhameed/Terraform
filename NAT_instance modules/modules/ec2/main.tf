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

resource "aws_instance" "nat_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  source_dest_check           = var.source_dest_check
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.security_group_id
  subnet_id                   = var.subnet_id

  tags = merge(
    {
      Name        = "${var.environment}-${var.application}-Instance"
      Environment = var.environment
      Owner       = var.owner
      CostCenter  = var.cost_center
      Application = var.application
    },
    var.tags
  )
  user_data = var.user_data
}

# update the  private route table

resource "aws_route" "rt_update" {
  route_table_id         = var.private_route_table_id
  destination_cidr_block = var.destination_cidr_block-nat_ec2
  network_interface_id   = aws_instance.nat_instance.primary_network_interface_id
}