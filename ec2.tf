resource "aws_instance" "Palo-Alto-VM" {
  ami           = var.user_ec2_palo_alto_ami
  instance_type               = var.user_ec2_instance_type
  tags = {
    Name = "Palo_Alto_VM_01"
  }
  network_interface {
    network_interface_id = aws_network_interface.palo_alto_eni_01.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.palo_alto_eni_02.id
    device_index         = 1
  }
  user_data = file("user_data_palo_alto.sh")
  key_name      = var.user_key_pair
}

resource "aws_instance" "Prod_server" {
  ami           = var.user_ec2_server_ami
  instance_type               = var.user_ec2_instance_type_2
  tags = {
    Name = "Production_Server"
  }
  iam_instance_profile = aws_iam_instance_profile.EC2_SSM_profile.id
  subnet_id = aws_subnet.production_private_1a.id
  vpc_security_group_ids = [aws_security_group.prod-vm-sg.id]
  user_data = file("user_data.sh")
}