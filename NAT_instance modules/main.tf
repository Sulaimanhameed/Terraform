
provider "aws" {
  region = var.region
}
module "vpc" {
  source = "./modules/vpc"

  client_name = var.client_name
  managed_by  = var.managed_by

  vpc_cidr_block                                 = var.vpc_cidr_block
  public_subnet_cidr_blocks                      = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks                     = var.private_subnet_cidr_blocks
  internet_gatewys_rt_add_destination_cidr_block = var.internet_gatewys_rt_add_destination_cidr_block
  nat_rt_add_destination_cidr_block              = var.nat_rt_add_destination_cidr_block

}
module "sg" {
  source                   = "./modules/security_group"
  public_sg_in_cidr_blocks = var.public_sg_in_cidr_blocks
  public_sg_in_from_port   = var.public_sg_in_from_port
  public_sg_in_to_port     = var.public_sg_in_to_port
  public_sg_in_protocol    = var.public_sg_in_protocol

  common_sg_eg_cidr_blocks = var.common_sg_eg_cidr_blocks
  common_sg_eg_from_prot   = var.common_sg_eg_from_prot
  common_sg_eg_to_prot     = var.common_sg_eg_to_prot
  common_sg_eg_protocol    = var.common_sg_eg_protocol

  private_sg_in_22_cidr_blocks = var.private_sg_in_22_cidr_blocks
  private_sg_in_22_from_port   = var.private_sg_in_22_from_port
  private_sg_in_22_to_port     = var.private_sg_in_22_to_port
  private_sg_in_22_protocol    = var.private_sg_in_22_protocol

  private_sg_in_80_cidr_blocks = var.private_sg_in_80_cidr_blocks
  private_sg_in_80_from_port   = var.private_sg_in_80_from_port
  private_sg_in_80_to_port     = var.private_sg_in_80_to_port
  private_sg_in_80_protocol    = var.private_sg_in_80_protocol

}

module "ec2" {
  source                      = "./modules/ec2"
  my-instance-type            = var.my-instance-type
  ami                         = var.ami
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
}

module "nat_instance" {
  source                          = "./modules/nat_ec2"
  ami_nat                         = var.ami
  instance_type_nat               = var.instance_type_nat
  associate_public_ip_address_nat = var.associate_public_ip_address
  source_dest_check               = var.source_dest_check
  nat_script                      = var.nat_script
}