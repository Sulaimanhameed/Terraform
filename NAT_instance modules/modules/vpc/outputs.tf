output "nat-vpc" {
  value = aws_vpc.nat-vpc.id
}
output "pub-subnet" {
  value = aws_subnet.pub-subnet.id
}
output "pvt-subnet" {
  value = aws_subnet.pvt-subnet.id
}