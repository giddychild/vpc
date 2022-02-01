resource "aws_instance" "Prod_server" {
  ami           = var.user_ec2_server_ami
  instance_type               = var.user_ec2_instance_type
  tags = {
    Name = "Production_Server"
  }
  iam_instance_profile = aws_iam_instance_profile.EC2_SSM_profile.id
  subnet_id = aws_subnet.production_private_1a.id
  vpc_security_group_ids = [aws_security_group.prod-vm-sg.id]
  user_data = file("user_data.sh")
}