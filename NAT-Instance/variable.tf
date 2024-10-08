variable "my-instance-type" {
  type    = string
  default = "t2.micro"
}

variable "client_name" {
  default = "my-default"
}
variable "managed_by" {
  default = "devops"
}
variable "provider_key" {
  type        = string
  description = "Region of the alb-asg"
}
variable "vpc_cidr_block" {
  type        = string
  description = "10.0.0.0/16"
}
variable "public_subnet_cidr_blocks" {
  type        = string
  description = "10.0.1.0/24"
}
variable "private_subnet_cidr_blocks" {
  type        = string
  description = "10.0.2.0/24"
}
variable "internet_gatewys_cidr_blocks" {
  type = string
  description = "0.0.0.0/0"
}
variable "public_sg_in_cidr_blocks" {
  type = list(any)
description = "0.0.0.0/0"  
}
variable "public_sg_en_cidr_blocks" {
  type = list(any)
  description = "0.0.0.0/0"
}
variable "private_sg_in_22_cidr_blocks" {
  type = list(any)
  default = [ "10.0.1.0/24" ]
}
variable "private_sg_in_80_cidr_blocks" {
  type = list(any)
  default = [ "0.0.0.0/0" ]
}
variable "private_sg_en_cidr_blocks" {
  type = list(any)
  default = [ "0.0.0.0/0" ]
}
variable "ami" {
  type = string
  default = "ami-05134c8ef96964280"
}
variable "key_name" {
  type = string
  default = "sulaiman"
}
variable "nat_rt_add" {
  type = string
  default = "0.0.0.0/0"
}