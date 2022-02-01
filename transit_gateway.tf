resource "aws_ec2_transit_gateway" "account-tgw" {
  description = "Main TGW"
  tags = {
    Name = "Account-TGW"
  }
}

//Once deployed, run command to enable appliance mode on this attachment [aws ec2 modify-transit-gateway-vpc-attachment --transit-gateway-attachment-id tgw-attach-0e6e7f3838392fb72 --options ApplianceModeSupport="enable"]
resource "aws_ec2_transit_gateway_vpc_attachment" "security-account-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  vpc_id             = aws_vpc.security_vpc.id
  dns_support        = "enable"
  subnet_ids = [aws_subnet.security_tgw_1a.id,aws_subnet.security_tgw_1b.id]
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "Security-VPC-TGW-Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "production-account-tgw-attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  vpc_id             = aws_vpc.production_vpc.id
  dns_support        = "enable"
  subnet_ids = [aws_subnet.production_private_1a.id,aws_subnet.production_private_1b.id]
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags = {
    Name = "Production-VPC-TGW-Attachment"
  }
}

resource "aws_ec2_transit_gateway_route_table" "prod-tgw-route-table" {
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  tags = {
    Name = "Production TGW Route Table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "prod-tgw-rtb-association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.production-account-tgw-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod-tgw-route-table.id
}

resource "aws_ec2_transit_gateway_route" "prod-tgw-route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security-account-tgw-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.prod-tgw-route-table.id
}

resource "aws_ec2_transit_gateway_route_table" "sec-tgw-route-table" {
  transit_gateway_id = aws_ec2_transit_gateway.account-tgw.id
  tags = {
    Name = "Security TGW Route Table"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "sec-tgw-rtb-association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security-account-tgw-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sec-tgw-route-table.id
}

resource "aws_ec2_transit_gateway_route" "sec-tgw-route" {
  destination_cidr_block         = var.user_vpc_sec_cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.security-account-tgw-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sec-tgw-route-table.id
}

resource "aws_ec2_transit_gateway_route" "sec-tgw-route-2" {
  destination_cidr_block         = var.user_vpc_prod_cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.production-account-tgw-attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.sec-tgw-route-table.id
}