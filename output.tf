output "vpc_id" {
  value = aws_vpc.security_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.security_vpc.cidr_block
}

output "security_natgw_subnet_a_id" {
  value = aws_subnet.security_natgw_1a.id
}

output "security_natgw_subnet_b_id" {
  value = aws_subnet.security_natgw_1b.id
}

output "security_hub_transit_subnet_a_id" {
  value = aws_subnet.security_hub_transit_1a.id
}

output "security_hub_transit_subnet_b_id" {
  value = aws_subnet.security_hub_transit_1b.id
}

output "security_gwlbe_subnet_a_id" {
  value = aws_subnet.security_gwlbe_1a.id
}

output "security_gwlbe_subnet_b_id" {
  value = aws_subnet.security_gwlbe_1b.id
}

output "security_tgw_subnet_a_id" {
  value = aws_subnet.security_tgw_1a.id
}

output "security_tgw_subnet_b_id" {
  value = aws_subnet.security_tgw_1b.id
}