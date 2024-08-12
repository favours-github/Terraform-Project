variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-2" # Set a default region or leave it empty to be filled during terraform apply
}

variable "aws_profile" {
  description = "The AWS profile to use for credentials."
  type        = string
  default     = "default" # Set the profile name as default, or customize it
}

variable "automation_tag" {
  description = "Tag to indicate whether the resource is automated."
  type        = string
  default     = "True" # Set a default tag value
}

variable "project_tag" {
  description = "Tag to identify the project."
  type        = string
  default     = "MyProject" # Replace with your project's name
}

variable "environment_tag" {
  description = "Tag to indicate the environment (e.g., Dev, Staging, Prod)."
  type        = string
  default     = "Dev" # Replace with your environment
}
