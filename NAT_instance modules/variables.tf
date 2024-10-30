variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  type        = string
  description = "List of availability zones"
}
variable "enable_dns_support" {
  type        = bool
  description = "whether to enable DNS support or not"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "whether to enable DNS hostnames or not"
}
variable "destination_cidr_block_ig" {
  type        = string
  description = "Set the destination cidr block"
}
variable "private_route_table_id" {
  description = "the ID of the route table"
}

#####################################################################
variable "vpc_id" {
  type        = string
  description = "ID of the VPC associated with the security group."
}
variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the EC2 security group resources."
}
variable "environment" {
  type        = string
  description = "The environment name for the resources."
}
variable "owner" {
  type        = string
  description = "Owner's name for the resource."
}
variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
}
variable "application" {
  type        = string
  description = "Name of the application related to the resource."
}
variable "ingress_cidr_from_port" {
  type        = list(number)
  description = "List of starting ports for cidr ingress rules of the EC2 security group."
}
variable "ingress_cidr_to_port" {
  type        = list(number)
  description = "List of ending ports for cidr ingress rules of the EC2 security group."
}
variable "ingress_cidr_protocol" {
  type        = list(string)
  description = "List of protocols for cidr ingress rules of the EC2 security group."
}
variable "ingress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for cidr ingress rules of the EC2 security group."
}
variable "ingress_sg_from_port" {
  type        = list(number)
  description = "List of starting ports for sg ingress rules of the EC2 security group."
}
variable "ingress_sg_to_port" {
  type        = list(number)
  description = "List of ending ports for sg ingress rules of the EC2 security group."
}
variable "ingress_sg_protocol" {
  type        = list(string)
  description = "List of protocols for sg ingress rules of the EC2 security group."
}
variable "ingress_security_group_ids" {
  type = list(string)
  description = "List of Security Group ids for sg ingress rules of the EC2 security group."
}
variable "egress_cidr_from_port" {
  type        = list(number)
  description = "List of starting ports for cidr egress rules of the EC2 security group."
}
variable "egress_cidr_to_port" {
  type        = list(number)
  description = "List of ending ports for cidr egress rules of the EC2 security group."
}
variable "egress_cidr_protocol" {
  type        = list(any)
  description = "List of protocols for cidr egress rules of the EC2 security group."
}
variable "egress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for cidr egress rules of the EC2 security group."
}
variable "egress_sg_from_port" {
  type        = list(number)
  description = "List of starting ports for sg egress rules of the EC2 security group."
}
variable "egress_sg_to_port" {
  type        = list(number)
  description = "List of ending ports for sg egress rules of the EC2 security group."
}
variable "egress_sg_protocol" {
  type        = list(any)
  description = "List of protocols for sg egress rules of the EC2 security group."
}
variable "egress_security_group_ids" {
  type = list(string)
  description = "List of Security Group ids for sg egress rules of the EC2 security group."
}
variable "create_ingress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block ingress rules."
}
variable "create_ingress_sg" {
  type        = bool
  description = "Enable or disable Security Groups ingress rules."
}

variable "create_egress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block egress rules."
}

variable "create_egress_sg" {
  type        = bool
  description = "Enable or disable Security Groups egress rules."
}
########################################
variable "ami_id" {
  type        = string
  description = "AMI Id of the ec2 instance"
}
variable "instance_type" {
  type        = string
  description = "Instance type of the ec2 instance"
}

variable "key_name" {
  type        = string
  description = "Key name of the ec2 instance"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ids of the ec2 instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Enable or disable public ip address"
}
variable "source_dest_check" {
  type        = bool
  description = "Stop the destination check"
}
variable "user_data" {
  type = string
}
variable "destination_cidr_block-nat_ec2" {
  type = string
}