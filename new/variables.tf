variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type        = string
  description = "List of public subnet CIDR blocks"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  type        = string
  description = "List of private subnet CIDR blocks"
  default     = "10.0.2.0/24"
}

variable "availability_zones" {
  type        = string
  description = "List of availability zones"
  default     = "us-west-2b"
}
#####################################################################
variable "vpc_id" {
  type        = string
  description = "ID of the VPC associated with the security group."
  default     = "aws_vpc.modules.vpc.main.id"
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
########################################
variable "ami_id" {
  type        = string
  description = "AMI Id of the ec2 instance"
  default     = "ami-03455155bfe406fa1"
}

variable "instance_type" {
  type        = string
  description = "Instance type of the ec2 instance"
  default     = "t4g.micro"
}

variable "key_name" {
  type        = string
  description = "Key name of the ec2 instance"
  default     = "sulaiman"
}


variable "associate_public_ip_address" {
  type        = bool
  description = "Enable or disable public ip address"
  default     = true
}

variable "source_dest_check" {
  type        = bool
  description = "Stop the destination check"
  default     = false
}
variable "nat_script" {
  type        = string
  description = "The NAT setup script"
  default     = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y iptables-services
  echo "net.ipv4.ip_forward = 1" | tee -a /etc/sysctl.conf
  sysctl -p
  sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
  service iptables save
  systemctl enable iptables
  systemctl start iptables
  EOF
}
