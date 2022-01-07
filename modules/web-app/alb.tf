resource "aws_lb" "alb" {
  name               = "alb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_app_ec2_all_in_out.id]
  subnets            = var.public_subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "test"
  }
}

resource "aws_lb_target_group" "lb_tg" {
  name     = "tf-web-alb-tg"
  port     = var.web_app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/healthz"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg.arn
  }
}