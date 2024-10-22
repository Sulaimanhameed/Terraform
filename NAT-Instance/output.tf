output "network_interface_id" {
  value = aws_instance.nat_instance.primary_network_interface_id
}


#  update the route table

resource "aws_route" "update" {
  route_table_id            = aws_route_table.pvt-RT.id
  destination_cidr_block    = var.nat_rt_add_destination_cidr_block
  network_interface_id      = aws_instance.nat_instance.primary_network_interface_id
}