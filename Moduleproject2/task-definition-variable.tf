


variable "container_image" {
  description = "The Docker image to be used in the ECS task."
  type        = string
}

variable "env_file" {
  description = "The environment file name stored in S3."
  type        = string
}

variable "subnets" {
  description = "List of subnets for the ECS service."
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups for the ECS service."
  type        = list(string)
}

variable "alb_target_group_arn" {
  description = "The ARN of the target group for the ALB."
  type        = string
}

