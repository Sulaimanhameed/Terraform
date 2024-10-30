# EC2 Instance Variables
region                      = "us-west-2"
ami_id                      = "ami-07dcfc8123b5479a8"
instance_type               = "t4g.small"
key_name                    = "sulaiman"
subnet_id                   = "aws_subnet.public.id"
associate_public_ip_address = true
source_dest_check           = false
user_data                   = <<-EOF
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

#vpc

destination_cidr_block-nat_ec2 = "0.0.0.0/0"
destination_cidr_block_ig      = "0.0.0.0/0"
private_route_table_id         = "aws_subnet.private.id"
vpc_cidr_block                 = "10.0.0.0/16"
enable_dns_support             = true
enable_dns_hostnames           = true
public_subnet_cidr_block       = "10.0.1.0/24"
private_subnet_cidr_block      = "10.0.2.0/24"
availability_zones             = "us-west-2b"


# EC2 Security Group Variables
vpc_id = "aws_vpc.main.id"

# Tag Keys
owner       = "nat_ninja"
environment = "test"
cost_center = "nat_ninja-commerce"
application = "NAT_INSTANCE"

# CIDR Ingress Variables
create_ingress_cidr    = true
ingress_cidr_from_port = [22, 80, 443, 0]
ingress_cidr_to_port   = [22, 80, 443, 0]
ingress_cidr_protocol  = ["tcp", "tcp", "tcp", "-1"]
ingress_cidr_block     = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0","0.0.0.0/0"]

# Security Group Ingress Variables
create_ingress_sg          = false
ingress_sg_from_port       = [80]
ingress_sg_to_port         = [80]
ingress_sg_protocol        = ["tcp"]
ingress_security_group_ids = ["0.0.0.0/0"]

# CIDR Egress Variables
create_egress_cidr    = true
egress_cidr_from_port = [0]
egress_cidr_to_port   = [0]
egress_cidr_protocol  = ["-1"]
egress_cidr_block     = ["0.0.0.0/0"]

# Security Group Egress Variables
create_egress_sg          = false
egress_sg_from_port       = [0]
egress_sg_to_port         = [0]
egress_sg_protocol        = ["-1"]
egress_security_group_ids = ["0.0.0.0/0"]
