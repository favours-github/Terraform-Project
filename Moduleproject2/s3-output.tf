# Export the S3 bucket name
output "env_file_bucket_name" {
  description = "The name of the S3 bucket used to store the environment file."
  value       = aws_s3_bucket.env_file_bucket.bucket
}

# Export the environment file name
output "env_file_name" {
  description = "The name of the environment file uploaded to the S3 bucket."
  value       = aws_s3_object.upload_env_file.key
}
