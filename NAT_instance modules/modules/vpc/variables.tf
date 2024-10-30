# Common Variables

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
}

variable "region" {
  type        = string
  description = "Region of the VPC"
}

# VPC Variables

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

# Subnet Varaibles

variable "public_subnet_cidr_block" {
  description = "CIDR blocks for public subnets"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "CIDR blocks for private subnets"
  type        = string
}


variable "availability_zones" {
  type        = string
  description = "List of availability zones"
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
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










