variable "subnet_id" {
  description = "Subnet ID for NAT instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for NAT instance"
  type        = string
}

variable "private_route_table_id" {
  description = "Private route table ID"
  type        = string
}

variable "client_name" {
  default = "nat_domo"
}
variable "managed_by" {
  default = "terraform"
}
################################################
variable "ami_nat" {
  type    = string
  default = "ami-03455155bfe406fa1"
}
variable "instance_type_nat" {
  type    = string
  default = "t4g.micro"
}
variable "key_name" {
  type    = string
  default = "sulaiman"
}
variable "nat_script" {
  default = <<-EOF
#!/bin/bash
set -e
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