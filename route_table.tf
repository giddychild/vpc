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

resource "aws_route_table" "production_db_rt" {
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

resource "aws_route_table_association" "production-public-association-a" {
  route_table_id = aws_route_table.production_public_rt.id
  subnet_id      = aws_subnet.production_public_1a.id
}

resource "aws_route_table_association" "production-public-association-b" {
  route_table_id = aws_route_table.production_public_rt.id
  subnet_id      = aws_subnet.production_public_1b.id
}

resource "aws_route_table_association" "production-private-association-a" {
  route_table_id = aws_route_table.production_private_rt.id
  subnet_id      = aws_subnet.production_private_1a.id
}

resource "aws_route_table_association" "production-private-association-b" {
  route_table_id = aws_route_table.production_private_rt.id
  subnet_id      = aws_subnet.production_private_1a.id
}

resource "aws_route_table_association" "production-db-association-a" {
  route_table_id = aws_route_table.production_db_rt.id
  subnet_id      = aws_subnet.production_db_1a.id
}

resource "aws_route_table_association" "production-db-association-b" {
  route_table_id = aws_route_table.production_db_rt.id
  subnet_id      = aws_subnet.production_db_1b.id
}

resource "aws_route" "db-subnet-route-1" {
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