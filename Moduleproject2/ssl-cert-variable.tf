variable "domain_name" {
  description = "The primary domain name for the ACM certificate."
  type        = string
}

variable "subject_alternative_names" {
  description = "A list of additional domain names to be included in the ACM certificate."
  type        = list(string)
  default     = [] # You can specify additional domain names if needed
}
