provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone  = var.availability_zone
}

module "security" {
  source = "./modules/security"

  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
}

module "nat" {
  source = "./modules/nat"

  subnet_id              = module.vpc.public_subnet_id
  security_group_id      = module.security.public_sg_id
  private_route_table_id = module.vpc.private_route_table_id
}
