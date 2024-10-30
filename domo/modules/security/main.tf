resource "aws_security_group" "public" {
  name        = "${var.client_name}-PUB-SG"
  description = "Public Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.public_sg_ingress_from_port_80
    to_port     = var.public_sg_ingress_to_port_80
    protocol    = var.public_sg_ingress_protocol_80
    cidr_blocks = var.public_sg_ingress_cidr_blocks_80
  }

  ingress {
    from_port   = var.public_sg_ingress_from_port_443
    to_port     = var.public_sg_ingress_to_port_443
    protocol    = var.public_sg_ingress_protocol_443
    cidr_blocks = var.public_sg_ingress_cidr_blocks_443
  }

  ingress {
    from_port   = var.public_sg_ingress_from_port_22
    to_port     = var.public_sg_ingress_to_port_22
    protocol    = var.public_sg_ingress_protocol_22
    cidr_blocks = var.public_sg_ingress_cidr_blocks_22
  }

  egress {
    from_port   = var.public_sg_egress_from_port
    to_port     = var.private_sg_egress_to_port
    protocol    = var.public_sg_egress_protocol
    cidr_blocks = var.public_sg_egress_cidr_blocks
  }

  tags = {
    Name       = "${var.client_name}-PUB-SG"
    Managed_by = "${var.managed_by}"
  }
}

resource "aws_security_group" "private" {
  name        = "${var.client_name}-PVT-SG"
  description = "Private Security Group"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.private_sg_ingress_from_port
    to_port         = var.private_sg_ingress_to_port
    protocol        = var.private_sg_ingress_protocol
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = var.private_sg_egress_from_port
    to_port     = var.private_sg_egress_to_port
    protocol    = var.private_sg_egress_protocol
    cidr_blocks = var.private_sg_egress_cidr_blocks
  }

 tags = {
    Name       = "${var.client_name}-PVT-SG"
    Managed_by = "${var.managed_by}"
  }
}

