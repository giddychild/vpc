resource "aws_network_interface" "ec2_eni_01" {
  subnet_id       = aws_subnet.production_natgw_1a.id
  security_groups = [aws_security_group.ec2-sg.id]
}
