output "vpc_id" {
  value = aws_vpc.security_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.security_vpc.cidr_block
}