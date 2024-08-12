# Create an S3 bucket
resource "aws_s3_bucket" "env_file_bucket" {
  bucket = "${var.project_name}-${var.environment}-env-file-bucket"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-env-file-bucket"
  }
}

# Upload the environment file from the local computer into the S3 bucket
resource "aws_s3_object" "upload_env_file" {
  bucket = aws_s3_bucket.env_file_bucket.bucket
  key    = "env/${var.environment_file_name}"
  source = "./${var.environment_file_name}"

  tags = {
    Name = "${var.project_name}-${var.environment}-env-file"
  }
}
