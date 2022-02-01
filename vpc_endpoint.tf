resource "aws_vpc_endpoint_service" "GWLBe_service" {
  acceptance_required        = false
  gateway_load_balancer_arns = [aws_lb.GWLB.arn]
}

resource "aws_vpc_endpoint" "GWLBe_endpoint_01" {
  service_name      = aws_vpc_endpoint_service.GWLBe_service.service_name
  subnet_ids        = [aws_subnet.security_gwlbe_1a.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.GWLBe_service.service_type
  vpc_id            = aws_vpc.security_vpc.id
  tags = {
    Name = "GWLBe01"
  }
}

resource "aws_vpc_endpoint" "GWLBe_endpoint_02" {
  service_name      = aws_vpc_endpoint_service.GWLBe_service.service_name
  subnet_ids        = [aws_subnet.security_gwlbe_1b.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.GWLBe_service.service_type
  vpc_id            = aws_vpc.security_vpc.id
  tags = {
    Name = "GWLBe02"
  }
}

resource "aws_vpc_endpoint" "GWLBe_endpoint_03" {
  service_name      = aws_vpc_endpoint_service.GWLBe_service.service_name
  subnet_ids        = [aws_subnet.production_gwlbe-1a.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.GWLBe_service.service_type
  vpc_id            = aws_vpc.production_vpc.id
  tags = {
    Name = "GWLBe03"
  }
}

resource "aws_vpc_endpoint" "GWLBe_endpoint_04" {
  service_name      = aws_vpc_endpoint_service.GWLBe_service.service_name
  subnet_ids        = [aws_subnet.production_gwlbe-1b.id]
  vpc_endpoint_type = aws_vpc_endpoint_service.GWLBe_service.service_type
  vpc_id            = aws_vpc.production_vpc.id
  tags = {
    Name = "GWLBe04"
  }
}


resource "aws_vpc_endpoint" "ssm-endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.prod-vm-sg.id
  ]
  subnet_ids = [aws_subnet.production_public_1a.id]
  private_dns_enabled = true
  tags = {
    Name = "Production-VPC-SSM-Endpoint"
  }
}

resource "aws_vpc_endpoint" "ssmmessages-endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.prod-vm-sg.id
  ]
  subnet_ids = [aws_subnet.production_public_1a.id]
  private_dns_enabled = true
  tags = {
    Name = "Production-VPC-SSMMessages-Endpoint"
  }
}

resource "aws_vpc_endpoint" "ec2messages-endpoint" {
  vpc_id            = aws_vpc.production_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.prod-vm-sg.id
  ]
  subnet_ids = [aws_subnet.production_public_1a.id]
  private_dns_enabled = true
  tags = {
    Name = "Production-VPC-EC2Messages-Endpoint"
  }
}