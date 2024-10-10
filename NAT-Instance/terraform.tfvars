# 1. provider 
provider_key                  = "us-west-2"

# 2. tag
client_name                   = "NAT"
managed_by                    = "terraform"

# 3. AWS VPC (Virtual Private Cloud)
vpc_cidr_block                = "10.0.0.0/16"

# 3. AWS Public and private Subnet
public_subnet_cidr_blocks     =  "10.0.1.0/24" 
private_subnet_cidr_blocks    = "10.0.2.0/24"

# 4. AWS Public and private Route table rule 
internet_gatewys_rt_add_destination_cidr_block = "0.0.0.0/0"
nat_rt_add_destination_cidr_block              = "0.0.0.0/0"

# 5. AWS public Security Group
public_sg_in_cidr_blocks      = [ "0.0.0.0/0" ]
public_sg_in_from_port        = "0"
public_sg_in_to_port          = "0"
public_sg_in_protocol         = "-1"
###############################
common_sg_eg_cidr_blocks      = [ "0.0.0.0/0" ]
common_sg_eg_from_prot        = "0"
common_sg_eg_to_prot          = "0"
common_sg_eg_protocol         = "-1"
###############################

# 6.AWS private security group 
private_sg_in_22_cidr_blocks  = [ "10.0.1.0/24" ]
pvivate_sg_in_22_from_port    = "22"
private_sg_in_22_to_port      = "22"
private_sg_in_22_protocol     = "tcp"

private_sg_in_80_cidr_blocks  = [ "0.0.0.0/0" ]
pvivate_sg_in_80_from_port    = "80"
private_sg_in_80_to_port      = "80"
private_sg_in_80_protocol     = "tcp"

# 7. public and private instance 
my-instance-type              = "t2.micro"
ami                           = "ami-05134c8ef96964280"
key_name                      = "sulaiman"
associate_public_ip_address   = "true"

# 8. NAT Instance 
ami_nat                         = "ami-03455155bfe406fa1"
instance_type_nat               = "t4g.micro"
associate_public_ip_address_nat = "true"
source_dest_check               = "false"
nat_script =  <<-EOF
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
