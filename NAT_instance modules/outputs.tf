output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_id
}

output "security_group_id" {
  value = module.sg.security_group_id
}
output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}
output "nat_id" {
  value = module.nat-instance.nat_id
}
output "nat_public_id" {
  value = module.nat-instance.nat_public_ip
}