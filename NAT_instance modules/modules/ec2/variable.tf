# # 1. provider 

variable "region" {
  type        = string
  default     = "us-west-2"
  description = "The AWS region to deploy resources in"
}
# 2. tag

variable "client_name" {
  default = "nat_domo"
}
variable "managed_by" {
  default = "terraform"
}
# 3. AWS VPC (Virtual Private Cloud)

# variable "vpc_cidr_block" {
#   type        = string
#   description = "CIDR block for the VPC"
#   default     = "10.0.0.0/16" # You can set a default or remove this line if you want to always specify it
# }

# # 3. AWS Public and private Subnet 

# variable "public_subnet_cidr_blocks" {
#   type        = list(string)
#   description = "10.0.1.0/24"
# }

# variable "private_subnet_cidr_blocks" {
#   type        = list(string)
#   description = "10.0.2.0/24"
# }

# # 4. AWS Public and private Route table rule 

# variable "internet_gatewys_rt_add_destination_cidr_block" {
#   type    = string
#   default = "0.0.0.0/0"
# }
# variable "nat_rt_add_destination_cidr_block" {
#   type    = string
#   default = "0.0.0.0/0"
# }

# 5. AWS public Security Group

variable "public_sg_in_from_port" {
  type        = number
  description = "From port for inbound rule in public security group"
  default     = 0 # or whatever default value you want
}

variable "public_sg_in_to_port" {
  type        = number
  description = "To port for inbound rule in public security group"
  default     = 0 # or whatever default value you want
}

variable "public_sg_in_protocol" {
  type    = string
  default = "-1"
}
variable "public_sg_in_cidr_blocks" {
  type        = list(string)
  description = "0.0.0.0/0"
  default     = ["0.0.0.0/0"]
}
############################################################################################
variable "common_sg_eg_cidr_blocks" {
  type        = list(string)
  description = "0.0.0.0/0"
  default     = ["0.0.0.0/0"]
}
variable "common_sg_eg_from_prot" {
  type    = number
  default = 0
}
variable "common_sg_eg_to_prot" {
  type    = number
  default = 0
}
variable "common_sg_eg_protocol" {
  type    = string
  default = "-1"
}
##############################################################################################

# 6.AWS private security group 

variable "private_sg_in_22_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
variable "private_sg_in_22_from_port" {
  type    = number
  default = 22
}
variable "private_sg_in_22_to_port" {
  type    = number
  default = 22
}
variable "private_sg_in_22_protocol" {
  type    = string
  default = "tcp"
}

variable "private_sg_in_80_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "private_sg_in_80_from_port" {
  type    = number
  default = 80
}
variable "private_sg_in_80_to_port" {
  type    = number
  default = 80
}
variable "private_sg_in_80_protocol" {
  type    = string
  default = "tcp"
}

# 7. public and private instance 

variable "my-instance-type" {
  type    = string
  default = "t2.micro"
}
variable "ami" {
  type    = string
  default = "ami-05134c8ef96964280"
}
variable "key_name" {
  type    = string
  default = "sulaiman"
}
variable "associate_public_ip_address" {
  type    = string
  default = "true"
}

# # 8. NAT Instance 

# variable "ami_nat" {
#   type    = string
#   default = "ami-03455155bfe406fa1"
# }
# variable "instance_type_nat" {
#   type    = string
#   default = "t4g.micro"
# }
# variable "associate_public_ip_address_nat" {
#   type    = string
#   default = "true"
# }
# variable "source_dest_check" {
#   type    = string
#   default = "false"
# }
# variable "nat_script" {
#   default = <<-EOF
# #!/bin/bash
# set -e
# yum update -y
# yum install -y iptables-services
# echo "net.ipv4.ip_forward = 1" | tee -a /etc/sysctl.conf
# sysctl -p
# sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
# service iptables save
# systemctl enable iptables
# systemctl start iptables
# EOF
# }