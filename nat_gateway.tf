resource "aws_nat_gateway" "production-ngw-1a" {
  allocation_id = aws_eip.elastic-ip-for-ngw-1a.id
  subnet_id     = aws_subnet.production_natgw_1a.id
  tags          = {
    Name = "Production NatGW A"
  }
  depends_on    = [aws_eip.elastic-ip-for-ngw-1a]
}

resource "aws_nat_gateway" "production-ngw-1b" {
  allocation_id = aws_eip.elastic-ip-for-ngw-1b.id
  subnet_id     = aws_subnet.production_natgw_1b.id
  tags          = {
    Name = "Production NatGW B"
  }
  depends_on    = [aws_eip.elastic-ip-for-ngw-1b]
}