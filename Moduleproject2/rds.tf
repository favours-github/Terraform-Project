# Create database subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "${var.project_name}-${var.environment}-database-subnets"
  subnet_ids  = var.database_subnet_ids
  description = "Subnets for database instance"

  tags = {
    Name = "${var.project_name}-${var.environment}-database-subnets"
  }
}

# Get information about a database snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.db_snapshot_identifier # Optional, if you know the exact identifier
  most_recent            = true
  snapshot_type          = "automated" # Could also be "manual" depending on your setup
}

# Launch an RDS instance from a database snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.db_instance_class
  skip_final_snapshot    = true
  availability_zone      = var.availability_zone
  identifier             = "${var.project_name}-${var.environment}-rds"
  snapshot_identifier    = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = var.multi_az
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}
