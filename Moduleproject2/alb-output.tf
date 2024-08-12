# Export the ALB target group ARN
output "alb_target_group_arn" {
  description = "The ARN of the ALB target group."
  value       = aws_lb_target_group.alb_target_group.arn
}

# Export the application load balancer DNS name
output "application_load_balancer_dns_name" {
  description = "The DNS name of the application load balancer."
  value       = aws_lb.application_load_balancer.dns_name
}

# Export the application load balancer zone ID
output "application_load_balancer_zone_id" {
  description = "The zone ID of the application load balancer."
  value       = aws_lb.application_load_balancer.zone_id
}
