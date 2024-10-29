variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC associated with the security group."
  default     = "module.vpc.vpc_id"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the EC2 security group resources."
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
  default     = "test"
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
  default     = "nat-tester"
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
  default     = "nat-tester_commerce"
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
  default     = "NAT"
}


variable "ingress_cidr_from_port" {
  type        = list(number)
  description = "List of starting ports for cidr ingress rules of the EC2 security group."
  default     = [22, 80, 443]
}

variable "ingress_cidr_to_port" {
  type        = list(number)
  description = "List of ending ports for cidr ingress rules of the EC2 security group."
  default     = [22, 80, 443]
}

variable "ingress_cidr_protocol" {
  type        = list(string)
  description = "List of protocols for cidr ingress rules of the EC2 security group."
  default     = ["tcp", "tcp", "tcp"]
}

variable "ingress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for cidr ingress rules of the EC2 security group."
  default     = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
}

variable "ingress_sg_from_port" {
  type        = list(number)
  description = "List of starting ports for sg ingress rules of the EC2 security group."
  default     = [80]
}

variable "ingress_sg_to_port" {
  type        = list(number)
  description = "List of ending ports for sg ingress rules of the EC2 security group."
  default     = [80]
}

variable "ingress_sg_protocol" {
  type        = list(string)
  description = "List of protocols for sg ingress rules of the EC2 security group."
  default     = ["tcp"]
}

variable "ingress_security_group_ids" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of Security Group ids for sg ingress rules of the EC2 security group."
}

variable "egress_cidr_from_port" {
  type        = list(number)
  description = "List of starting ports for cidr egress rules of the EC2 security group."
  default     = [0]
}

variable "egress_cidr_to_port" {
  type        = list(number)
  description = "List of ending ports for cidr egress rules of the EC2 security group."
  default     = [0]
}

variable "egress_cidr_protocol" {
  type        = list(any)
  description = "List of protocols for cidr egress rules of the EC2 security group."
  default     = ["-1"]
}

variable "egress_cidr_block" {
  type        = list(string)
  description = "List of CIDR blocks for cidr egress rules of the EC2 security group."
  default     = ["0.0.0.0/0"]
}

variable "egress_sg_from_port" {
  type        = list(number)
  description = "List of starting ports for sg egress rules of the EC2 security group."
  default     = [0]
}

variable "egress_sg_to_port" {
  type        = list(number)
  description = "List of ending ports for sg egress rules of the EC2 security group."
  default     = [0]
}

variable "egress_sg_protocol" {
  type        = list(any)
  description = "List of protocols for sg egress rules of the EC2 security group."
  default     = ["-1"]
}

variable "egress_security_group_ids" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of Security Group ids for sg egress rules of the EC2 security group."
}

variable "create_ingress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block ingress rules."
  default     = true
}

variable "create_ingress_sg" {
  type        = bool
  description = "Enable or disable Security Groups ingress rules."
  default     = false
}

variable "create_egress_cidr" {
  type        = bool
  description = "Enable or disable CIDR block egress rules."
  default     = true
}

variable "create_egress_sg" {
  type        = bool
  description = "Enable or disable Security Groups egress rules."
  default     = false
}