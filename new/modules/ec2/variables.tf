variable "region" {
  type        = string
  description = "Region of the ec2 instance"
  default     = "us-west-2"
}

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

variable "subnet_id" {
  description = "List of subnet IDs where instances will be created"
  type        = string
  default     = "value"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the ec2-sg resources"
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

variable "security_group_id" {
  description = "List of security group IDs to attach to the EC2 instance."
  type        = list(string)

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

variable "private_route_table_id" {
  description = "the ID of the route table"
}