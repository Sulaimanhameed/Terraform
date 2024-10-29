

module "vpc" {
  source                    = "./modules/vpc"
  region                    = var.region
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  availability_zones        = var.availability_zones
}

module "sg" {
  source = "./modules/security-group"
  region = var.region
  vpc_id = module.vpc.vpc_id

  ingress_cidr_from_port     = var.ingress_cidr_from_port
  ingress_cidr_to_port       = var.ingress_cidr_to_port
  ingress_cidr_protocol      = var.ingress_cidr_protocol
  ingress_cidr_block         = var.ingress_cidr_block
  create_ingress_cidr        = var.create_ingress_cidr
  ingress_sg_from_port       = var.ingress_sg_from_port
  ingress_sg_to_port         = var.ingress_sg_to_port
  ingress_sg_protocol        = var.ingress_sg_protocol
  ingress_security_group_ids = var.ingress_security_group_ids
  create_ingress_sg          = var.create_ingress_sg
  egress_cidr_from_port      = var.egress_cidr_from_port
  egress_cidr_to_port        = var.egress_cidr_to_port
  egress_cidr_protocol       = var.egress_cidr_protocol
  egress_cidr_block          = var.egress_cidr_block
  create_egress_cidr         = var.create_egress_cidr
  egress_sg_from_port        = var.egress_sg_from_port
  egress_sg_to_port          = var.egress_sg_to_port
  egress_sg_protocol         = var.egress_sg_protocol
  egress_security_group_ids  = var.egress_security_group_ids
  create_egress_sg           = var.create_egress_sg

  environment = var.environment
  owner       = var.owner
  cost_center = var.cost_center
  application = var.application
}

module "nat-instance" {
  source                      = "./modules/ec2"
  region                      = var.region
  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.vpc.public_subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  security_group_id           = [module.sg.security_group_id]
  source_dest_check           = var.source_dest_check
  private_route_table_id      = module.vpc.private_route_table_id
  environment                 = var.environment
  owner                       = var.owner
  cost_center                 = var.cost_center
  application                 = var.application
  nat_script                  = var.nat_script
}