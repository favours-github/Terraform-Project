# Create Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name                       = var.alb_name
  internal                   = var.alb_internal
  load_balancer_type         = var.alb_type
  security_groups            = var.alb_security_groups
  subnets                    = var.alb_subnets
  enable_deletion_protection = var.alb_enable_deletion_protection

  tags = {
    Name = var.alb_name
  }
}

# Create Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name        = var.target_group_name
  target_type = var.target_type
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }
}

# Create a Listener on Port 80 with Redirect Action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.http_listener_port
  protocol          = var.http_listener_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Create a Listener on Port 443 with Forward Action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn  = aws_lb.application_load_balancer.arn
  port               = var.https_listener_port
  protocol           = var.https_listener_protocol
  ssl_policy         = "ELBSecurityPolicy-2016-08"
  certificate_arn    = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
