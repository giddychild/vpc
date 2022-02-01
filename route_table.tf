resource "aws_route_table" "security_natgw_1a_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security NATGW-1A RT"
  }
}

resource "aws_route_table" "security_natgw_1b_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security NATGW-1B RT"
  }
}

resource "aws_route_table" "security_hub_transit_1a_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security Hub Transit-1A RT"
  }
}

resource "aws_route_table" "security_hub_transit_1b_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security Hub Transit-1B RT"
  }
}

resource "aws_route_table" "security_gwlbe_1a_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security GWLBe-1A RT"
  }
}

resource "aws_route_table" "security_gwlbe_1b_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security GWLBe-1B RT"
  }
}

resource "aws_route_table" "security_tgw_1a_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security TGW-1A RT"
  }
}

resource "aws_route_table" "security_tgw_1b_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security TGW-1B RT"
  }
}

resource "aws_route_table" "security_igw_rt" {
  vpc_id = aws_vpc.security_vpc.id
  tags   = {
    Name = "Security IGW RT"
  }
}

resource "aws_route_table" "production_public_rt" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production Public RT"
  }
}

resource "aws_route_table" "production_private_rt" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production Private RT"
  }
}

resource "aws_route_table" "production_gwlbe_rt" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production GWLBe RT"
  }
}

resource "aws_route_table" "production_igw_rt" {
  vpc_id = aws_vpc.production_vpc.id
  tags   = {
    Name = "Production IGW RT"
  }
}

resource "aws_route_table_association" "security-natgw-a-association" {
  route_table_id = aws_route_table.security_natgw_1a_rt.id
  subnet_id      = aws_subnet.security_natgw_1a.id
}

resource "aws_route_table_association" "security-natgw-b-association" {
  route_table_id = aws_route_table.security_natgw_1b_rt.id
  subnet_id      = aws_subnet.security_natgw_1b.id
}

resource "aws_route_table_association" "security-hub-transit-a-association" {
  route_table_id = aws_route_table.security_hub_transit_1a_rt.id
  subnet_id      = aws_subnet.security_hub_transit_1a.id
}

resource "aws_route_table_association" "security-hub-transit-b-association" {
  route_table_id = aws_route_table.security_hub_transit_1b_rt.id
  subnet_id      = aws_subnet.security_hub_transit_1b.id
}

resource "aws_route_table_association" "security-gwlbe-a-association" {
  route_table_id = aws_route_table.security_gwlbe_1a_rt.id
  subnet_id      = aws_subnet.security_gwlbe_1a.id
}

resource "aws_route_table_association" "security-gwlbe-b-association" {
  route_table_id = aws_route_table.security_gwlbe_1b_rt.id
  subnet_id      = aws_subnet.security_gwlbe_1b.id
}

resource "aws_route_table_association" "security-tgw-a-association" {
  route_table_id = aws_route_table.security_tgw_1a_rt.id
  subnet_id      = aws_subnet.security_tgw_1a.id
}

resource "aws_route_table_association" "security-tgw-b-association" {
  route_table_id = aws_route_table.security_tgw_1b_rt.id
  subnet_id      = aws_subnet.security_tgw_1b.id
}

resource "aws_route_table_association" "security-igw-association" {
  route_table_id = aws_route_table.security_igw_rt.id
  gateway_id = aws_internet_gateway.security-igw.id
}

resource "aws_route_table_association" "production-public-association" {
  route_table_id = aws_route_table.production_public_rt.id
  subnet_id      = aws_subnet.production_public_1a.id
}

resource "aws_route_table_association" "production-private-association" {
  route_table_id = aws_route_table.production_private_rt.id
  subnet_id      = aws_subnet.production_private_1a.id
}

resource "aws_route_table_association" "production-gwlbe-association" {
  route_table_id = aws_route_table.production_gwlbe_rt.id
  subnet_id      = aws_subnet.production_gwlbe-1a.id
}

resource "aws_route_table_association" "production-igw-association" {
  route_table_id = aws_route_table.production_igw_rt.id
  gateway_id = aws_internet_gateway.production-igw.id
}

resource "aws_route" "natgw-subnet-route-1" {
  route_table_id         = aws_route_table.security_natgw_1a_rt.id
  gateway_id             = aws_internet_gateway.security-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "natgw-subnet-route-2" {
  route_table_id         = aws_route_table.security_natgw_1b_rt.id
  gateway_id             = aws_internet_gateway.security-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "natgw-subnet-route-3" {
  route_table_id         = aws_route_table.security_natgw_1a_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_01.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "natgw-subnet-route-4" {
  route_table_id         = aws_route_table.security_natgw_1b_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_02.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "tgw-subnet-route-1" {
  route_table_id         = aws_route_table.security_tgw_1a_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_01.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "tgw-subnet-route-2" {
  route_table_id         = aws_route_table.security_tgw_1b_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_02.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "gwlbe-subnet-route-1" {
  route_table_id         = aws_route_table.security_gwlbe_1a_rt.id
  //transit_gateway_id = var.user_transit_gateway_id
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "gwlbe-subnet-route-2" {
  route_table_id         = aws_route_table.security_gwlbe_1b_rt.id
  //transit_gateway_id = var.user_transit_gateway_id
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "prod-gwlbe-subnet-route-1" {
  route_table_id         = aws_route_table.production_gwlbe_rt.id
  //transit_gateway_id = var.user_transit_gateway_id
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "prod-gwlbe-subnet-route-2" {
  route_table_id         = aws_route_table.production_gwlbe_rt.id
  gateway_id             = aws_internet_gateway.production-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "prod-public-subnet-route-1" {
  route_table_id         = aws_route_table.production_public_rt.id
  //transit_gateway_id = var.user_transit_gateway_id
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  destination_cidr_block = "172.0.0.0/8"
}

resource "aws_route" "prod-public-subnet-route-2" {
  route_table_id         = aws_route_table.production_public_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_03.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "prod-private-subnet-route-1" {
  route_table_id         = aws_route_table.production_private_rt.id
  //transit_gateway_id = var.user_transit_gateway_id
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "prod-igw-route-1" {
  route_table_id         = aws_route_table.production_igw_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.GWLBe_endpoint_03.id
  destination_cidr_block = var.user_production_public_1a_cidr
}

resource "aws_route" "nat-gw-route-1a" {
  route_table_id         = aws_route_table.security_gwlbe_1a_rt.id
  nat_gateway_id         = aws_nat_gateway.security-ngw-1a.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "nat-gw-route-1b" {
  route_table_id         = aws_route_table.security_gwlbe_1b_rt.id
  nat_gateway_id         = aws_nat_gateway.security-ngw-1b.id
  destination_cidr_block = "0.0.0.0/0"
}