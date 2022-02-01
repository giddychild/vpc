resource "aws_subnet" "production_public_1a" {
  cidr_block        = var.user_production_public_1a_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Production_Public Subnet A"
  }
}

resource "aws_subnet" "production_public_1b" {
  cidr_block        = var.user_production_public_1b_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Production_Public Subnet B"
  }
}

resource "aws_subnet" "production_private_1a" {
  cidr_block        = var.user_production_private_1a_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Production_Private Subnet A"
  }
}

resource "aws_subnet" "production_private_1b" {
  cidr_block        = var.user_production_private_1b_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Production_Private Subnet B"
  }
}

resource "aws_subnet" "production_db_1a" {
  cidr_block        = var.user_production_db_1a_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Production_DB Subnet A"
  }
}

resource "aws_subnet" "production_db_1b" {
  cidr_block        = var.user_production_db_1b_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Production_DB Subnet B"
  }
}