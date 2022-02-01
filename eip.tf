resource "aws_eip" "elastic-ip-for-ngw-1a" {
  vpc  = true
  tags = {
    Name = "Security-NGW EIP A"
  }
}

resource "aws_eip" "elastic-ip-for-ngw-1b" {
  vpc  = true
  tags = {
    Name = "Security-NGW EIP B"
  }
}

resource "aws_eip" "elastic-ip-palo-alto-vm-1a" {
  vpc  = true
  tags = {
    Name = "Palo Alto VM EIP A"
  }
}

resource "aws_eip_association" "elastic-ip-palo-alto-association" {
  network_interface_id = aws_network_interface.palo_alto_eni_01.id
  allocation_id = aws_eip.elastic-ip-palo-alto-vm-1a.id
}