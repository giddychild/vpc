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

resource "aws_eip" "elastic-ip-ec2-a" {
  vpc  = true
  tags = {
    Name = "EC2 Server EIP A"
  }
}

resource "aws_eip_association" "elastic-ip-ec2-association" {
  network_interface_id = aws_network_interface.ec2_eni_01.id
  allocation_id = aws_eip.elastic-ip-ec2-a.id
}