# Create a Launch Template
resource "aws_launch_template" "webserver_launch_template" {
  name          = var.launch_template_name
  image_id      = var.launch_template_image_id
  instance_type = var.launch_template_instance_type
  key_name      = var.launch_template_key_name
  description   = var.launch_template_description

  monitoring {
    enabled = var.launch_template_monitoring_enabled
  }

  vpc_security_group_ids = var.launch_template_security_group_ids
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "auto_scaling_group" {
  vpc_zone_identifier = var.asg_vpc_zone_identifier
  desired_capacity    = var.asg_desired_capacity
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  name                = var.asg_name
  health_check_type   = var.asg_health_check_type

  launch_template {
    name    = aws_launch_template.webserver_launch_template.name
    version = "$Latest"
  }

  tag {
    key                 = var.asg_tag_key
    value               = var.asg_tag_value
    propagate_at_launch = true
  }

}

# Attach Auto Scaling Group to ALB Target Group
resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
  lb_target_group_arn    = var.alb_target_group_arn
}

# Create an Auto Scaling Group Notification
resource "aws_autoscaling_notification" "webserver_asg_notifications" {
  group_names = [aws_autoscaling_group.auto_scaling_group.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = var.sns_topic_arn
}
