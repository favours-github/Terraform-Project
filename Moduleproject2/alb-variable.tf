variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "MyProject" # Replace with your project name
}

variable "environment" {
  description = "The environment name (e.g., Dev, Staging, Prod)."
  type        = string
  default     = "Dev" # Replace with your environment name
}

variable "alb_internal" {
  description = "Whether the ALB is internal or external."
  type        = bool
  default     = false # Set to true if the ALB is internal
}

variable "alb_security_groups" {
  description = "List of security group IDs to assign to the ALB."
  type        = list(string)
  
}

variable "alb_subnets" {
  description = "List of subnet IDs for the ALB."
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection on the ALB."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "The VPC ID where the ALB and target group will be created."
  type        = string
}
