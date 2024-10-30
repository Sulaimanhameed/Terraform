output "nat_instance_id" {
  value = aws_instance.nat.id
}

output "nat_instance_public_ip" {
  value = aws_instance.nat.public_ip
}