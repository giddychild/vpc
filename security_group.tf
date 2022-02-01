resource "aws_security_group" "palo-vm-sg" {
  name        = "palo-vm-sg"
  description = "Internet Traffic to Palo VM SG"
  vpc_id      = aws_vpc.security_vpc.id
  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags        = {
    Name = "Palo VM SG"
  }
}

resource "aws_security_group" "prod-vm-sg" {
  name        = "prod-vm-sg"
  description = "Internet Traffic to Prod VMs"
  vpc_id      = aws_vpc.production_vpc.id
  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags        = {
    Name = "Prod VM SG"
  }
}