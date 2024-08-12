# Output for the Application Load Balancer Security Group
output "alb_security_group_id" {
  description = "The ID of the security group for the Application Load Balancer."
  value       = aws_security_group.alb_security_group.id
}

# Output for the Bastion Host Security Group
output "bastion_security_group_id" {
  description = "The ID of the security group for the Bastion Host."
  value       = aws_security_group.bastion_security_group.id
}

# Output for the App Server Security Group
output "app_server_security_group_id" {
  description = "The ID of the security group for the App Server."
  value       = aws_security_group.app_server_security_group.id
}

# Output for the Database Security Group
output "database_security_group_id" {
  description = "The ID of the security group for the Database."
  value       = aws_security_group.database_security_group.id
}
