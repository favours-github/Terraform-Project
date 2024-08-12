


variable "bastion_allowed_cidr" {
  description = "The CIDR block allowed to access the Bastion host via SSH."
  type        = string
  default     = "0.0.0.0/0" # Replace with your specific CIDR block
}
