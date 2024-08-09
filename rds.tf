# Create Database Subnet Group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = var.db_subnet_group_name
  subnet_ids  = var.database_subnet_ids
  description = "subnets for database instance"

  tags = {
    Name = var.db_subnet_group_name
  }
}

# Get Information About a Database Snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.db_snapshot_identifier
  most_recent            = var.most_recent_snapshot
  snapshot_type          = var.snapshot_type
}

# Launch an RDS Instance from a Database Snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.db_instance_class
  skip_final_snapshot    = var.skip_final_snapshot
  availability_zone      = var.db_availability_zone
  identifier             = var.db_identifier
  snapshot_identifier    = var.db_snapshot_identifier
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = var.multi_az
  vpc_security_group_ids = var.db_vpc_security_group_ids
}
