resource "aws_internet_gateway" "production-igw" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production-IGW"
  }
}