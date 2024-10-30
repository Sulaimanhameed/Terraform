variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "client_name" {
  default = "nat_domo"
}
variable "managed_by" {
  default = "terraform"
}


variable "public_sg_ingress_from_port_80" {
  type = number
  default = 80
}
variable "public_sg_ingress_to_port_80" {
  type = number
  default = 80
}
variable "public_sg_ingress_protocol_80" {
  type = string
  default = "tcp"
}
variable "public_sg_ingress_cidr_blocks_80" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "public_sg_ingress_from_port_443" {
  type = number
  default = 443
}
variable "public_sg_ingress_to_port_443" {
  type = number
  default = 443
}
variable "public_sg_ingress_protocol_443" {
  type = string
  default = "tcp"
}
variable "public_sg_ingress_cidr_blocks_443" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "public_sg_ingress_from_port_22" {
  type = number
  default = 22
}
variable "public_sg_ingress_to_port_22" {
  type = number
  default = 22
}
variable "public_sg_ingress_protocol_22" {
  type = string
  default = "tcp"
}
variable "public_sg_ingress_cidr_blocks_22" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "public_sg_egress_from_port" {
  type = number
  default = 0
}
variable "public_sg_egress_to_port" {
  type = number
  default = 0
}
variable "public_sg_egress_protocol" {
  type = string
  default = "-1"
}
variable "public_sg_egress_cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}
################################################
variable "private_sg_ingress_from_port" {
  type = number
  default = 0
}
variable "private_sg_ingress_to_port" {
  type = number
  default = 0
}
variable "private_sg_ingress_protocol" {
  type = string
  default = "tcp"
}


variable "private_sg_egress_from_port" {
  type = number
  default = 0
}
variable "private_sg_egress_to_port" {
  type = number
  default = 0
}
variable "private_sg_egress_protocol" {
  type = string
  default = "-1"
}
variable "private_sg_egress_cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}