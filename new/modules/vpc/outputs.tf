output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "List of private subnet IDs"
}

output "cidr_block" {
  value       = var.vpc_cidr_block
  description = "The CIDR block associated with the VPC"
}
output "private_route_table_id" {
  value = aws_route_table.private.id
}
