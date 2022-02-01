/*resource "aws_launch_configuration" "palo_vm_launch_configuration" {
  name_prefix                 = "Palo-Alto-VM-"
  image_id = "ami-07bf21ba2f5a5ed8b"
  instance_type               = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.EC2_SSM_profile.name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.palo-vm-sg.id]
  lifecycle {
    create_before_destroy = true
  }
}*/

/*
resource "aws_autoscaling_group" "palo_alto_asg" {
  name                 = "Palo Alto Autoscaling Group 01"
  launch_configuration = aws_launch_configuration.palo_vm_launch_configuration.name
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  vpc_zone_identifier  = [aws_subnet.security_natgw_1a.id,aws_subnet.security_natgw_1b.id]
  lifecycle {
    create_before_destroy = true
    ignore_changes = [load_balancers, target_group_arns]
  }
  tag {
    key                 = "Name"
    value               = "Palo-Alto-VM"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "palo_alto_attachment" {
  autoscaling_group_name = aws_autoscaling_group.palo_alto_asg.name
  alb_target_group_arn   = aws_lb_target_group.GWLB-TG.arn
}
*/
