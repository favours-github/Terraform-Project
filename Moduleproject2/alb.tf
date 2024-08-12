# Create application load balancer
resource "aws_lb" "application_load_balancer" {
  name                       = "${var.project_name}-${var.environment}-alb"
  internal                   = var.alb_internal
  load_balancer_type         = "application"
  security_groups            = var.alb_security_groups
  subnets                    = var.alb_subnets
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

# Create target group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.project_name}-${var.environment}-tg"
  target_type = "instance" # Change if needed (e.g., "ip" or "lambda")
  port        = 80         # Adjust based on your application needs
  protocol    = "HTTP"     # Adjust based on your application needs
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# Create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.acm_certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
