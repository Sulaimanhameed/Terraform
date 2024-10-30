
output "nat_id" {
  value = aws_instance.nat_instance.id
}
output "nat_public_ip" {
  value = aws_instance.nat_instance.public_ip
}
