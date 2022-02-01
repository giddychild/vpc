resource "aws_internet_gateway" "security-igw" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security-IGW"
  }
}

resource "aws_internet_gateway" "production-igw" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production-IGW"
  }
}