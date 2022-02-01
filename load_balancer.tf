resource "aws_lb" "GWLB" {
  load_balancer_type = "gateway"
  name               = "GWLB"
  subnet_mapping {
    subnet_id = aws_subnet.security_gwlbe_1a.id
  }
  subnet_mapping {
    subnet_id = aws_subnet.security_gwlbe_1b.id
  }
  enable_cross_zone_load_balancing   = true
}

resource "aws_lb_listener" "GWLBe_Listener" {
  load_balancer_arn = aws_lb.GWLB.arn
  default_action {
    target_group_arn = aws_lb_target_group.GWLB-TG.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "GWLB-TG" {
  name     = "GWLBe"
  port     = 6081
  protocol = "GENEVE"
  vpc_id   = aws_vpc.security_vpc.id
  target_type = "ip"
  health_check {
    protocol = "TCP"
    port = 80
    healthy_threshold = 3
    unhealthy_threshold = 3
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "GWLB_LB_Attachment" {
  target_group_arn = aws_lb_target_group.GWLB-TG.arn
  target_id = aws_network_interface.palo_alto_eni_02.private_ip
}