resource "aws_network_interface" "palo_alto_eni_01" {
  subnet_id       = aws_subnet.security_natgw_1a.id
  security_groups = [aws_security_group.palo-vm-sg.id]
}

resource "aws_network_interface" "palo_alto_eni_02" {
  subnet_id       = aws_subnet.security_hub_transit_1a.id
  security_groups = [aws_security_group.palo-vm-sg.id]
}