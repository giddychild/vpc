resource "aws_nat_gateway" "security-ngw-1a" {
  allocation_id = aws_eip.elastic-ip-for-ngw-1a.id
  subnet_id     = aws_subnet.security_natgw_1a.id
  tags          = {
    Name = "Security NatGW A"
  }
  depends_on    = [aws_eip.elastic-ip-for-ngw-1a]
}

resource "aws_nat_gateway" "security-ngw-1b" {
  allocation_id = aws_eip.elastic-ip-for-ngw-1b.id
  subnet_id     = aws_subnet.security_natgw_1b.id
  tags          = {
    Name = "Security NatGW B"
  }
  depends_on    = [aws_eip.elastic-ip-for-ngw-1b]
}