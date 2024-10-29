# Common Variables

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "region" {
  type        = string
  description = "Region of the VPC"
  default     = "us-west-2"
}

# VPC Variables

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# Subnet Varaibles

variable "public_subnet_cidr_block" {
  description = "CIDR blocks for public subnets"
  type        = string
  default     = "10.0.1.0/24" # Adjust these values according to your needs
}

variable "private_subnet_cidr_block" {
  description = "CIDR blocks for private subnets"
  type        = string
  default     = "10.0.2.0/24" # Adjust these values according to your needs
}


variable "availability_zones" {
  type        = string
  description = "List of availability zones"
  default     = "us-west-2b"
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
  default     = "nat-tester"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
  default     = "test"
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


variable "enable_dns_support" {
  type        = bool
  description = "whether to enable DNS support or not"
  default     = false
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "whether to enable DNS hostnames or not"
  default     = false
}



variable "destination_cidr_block_ig" {
  type        = string
  description = "Set the destination cidr block"
  default     = "0.0.0.0/0"
}










