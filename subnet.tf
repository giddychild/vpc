resource "aws_subnet" "security_natgw_1a" {
  cidr_block        = var.user_security_natgw_1a_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Security_NATGW Subnet A"
  }
}

resource "aws_subnet" "security_natgw_1b" {
  cidr_block        = var.user_security_natgw_1b_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Security_NATGW Subnet B"
  }
}

resource "aws_subnet" "security_hub_transit_1a" {
  cidr_block        = var.user_security_hub_transit_1a_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Security_Hub_Transit Subnet A"
  }
}

resource "aws_subnet" "security_hub_transit_1b" {
  cidr_block        = var.user_security_hub_transit_1b_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Security_Hub_Transit Subnet B"
  }
}

resource "aws_subnet" "security_gwlbe_1a" {
  cidr_block        = var.user_security_gwlbe_1a_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Security_GWLBe Subnet A"
  }
}

resource "aws_subnet" "security_gwlbe_1b" {
  cidr_block        = var.user_security_gwlbe_1b_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Security_GWLBe Subnet B"
  }
}

resource "aws_subnet" "security_tgw_1a" {
  cidr_block        = var.user_security_tgw_1a_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Security_TGW Subnet A"
  }
}

resource "aws_subnet" "security_tgw_1b" {
  cidr_block        = var.user_security_tgw_1b_cidr
  vpc_id            = aws_vpc.security_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Security_TGW Subnet B"
  }
}

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

resource "aws_subnet" "production_gwlbe-1a" {
  cidr_block        = var.user_production_gwlbe_1a_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1a"
  tags              = {
    Name = "Production_GWLBe Subnet A"
  }
}

resource "aws_subnet" "production_gwlbe-1b" {
  cidr_block        = var.user_production_gwlbe_1b_cidr
  vpc_id            = aws_vpc.production_vpc.id
  availability_zone = "us-east-1b"
  tags              = {
    Name = "Production_GWLBe Subnet B"
  }
}