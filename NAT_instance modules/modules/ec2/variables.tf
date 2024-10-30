variable "region" {
  type        = string
  description = "Region of the ec2 instance"
}

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
  description = "List of subnet IDs where instances will be created"
  type        = string
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the ec2-sg resources"
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

variable "security_group_id" {
  description = "List of security group IDs to attach to the EC2 instance."
  type        = list(string)

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

variable "private_route_table_id" {
  description = "the ID of the route table"
}
variable "destination_cidr_block-nat_ec2" {
  type = string
}