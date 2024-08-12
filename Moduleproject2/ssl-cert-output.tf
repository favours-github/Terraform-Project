# Export the ACM certificate ARN
output "certificate_arn" {
  description = "The ARN of the ACM certificate."
  value       = aws_acm_certificate.acm_certificate.arn
}

# Export the domain name
output "domain_name" {
  description = "The domain name associated with the ACM certificate."
  value       = aws_acm_certificate.acm_certificate.domain_name
}
