resource "aws_vpc" "security_vpc" {
  cidr_block           = var.user_vpc_sec_cidr
  enable_dns_hostnames = true
  tags                 = {
    Name = "Security VPC"
  }
}

resource "aws_vpc" "production_vpc" {
  cidr_block           = var.user_vpc_prod_cidr
  enable_dns_hostnames = true
  tags                 = {
    Name = "Production VPC"
  }
}