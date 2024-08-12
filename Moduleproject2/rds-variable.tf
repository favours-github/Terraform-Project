


variable "database_subnet_ids" {
  description = "List of subnet IDs to be used for the RDS instance."
  type        = list(string)
}

variable "db_snapshot_identifier" {
  description = "The identifier of the DB snapshot. Optional if using the most recent automated snapshot."
  type        = string
  default     = "" # Optional, you can provide a specific identifier here
}

variable "db_instance_class" {
  description = "The instance class for the RDS database."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the RDS instance in."
  type        = string
}

variable "multi_az" {
  description = "Whether to enable Multi-AZ support for the RDS instance."
  type        = bool
  default     = false
}
