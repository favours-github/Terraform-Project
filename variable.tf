variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "The instance tenancy setting for the VPC (default or dedicated)"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "my-vpc"
}

variable "internet_gateway_name" {
  description = "Name tag for the Internet Gateway"
  type        = string
  default     = "my-internet-gateway"
}

variable "public_subnet_az1_cidr_block" {
  description = "CIDR block for the public subnet in AZ1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_az2_cidr_block" {
  description = "CIDR block for the public subnet in AZ2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_name_az1" {
  description = "Name tag for the public subnet in AZ1"
  type        = string
  default     = "public-subnet-az1"
}

variable "public_subnet_name_az2" {
  description = "Name tag for the public subnet in AZ2"
  type        = string
  default     = "public-subnet-az2"
}

variable "private_app_subnet_az1_cidr_block" {
  description = "CIDR block for the private app subnet in AZ1"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_app_subnet_az2_cidr_block" {
  description = "CIDR block for the private app subnet in AZ2"
  type        = string
  default     = "10.0.4.0/24"
}

variable "private_app_subnet_name_az1" {
  description = "Name tag for the private app subnet in AZ1"
  type        = string
  default     = "private-app-subnet-az1"
}

variable "private_app_subnet_name_az2" {
  description = "Name tag for the private app subnet in AZ2"
  type        = string
  default     = "private-app-subnet-az2"
}

variable "private_data_subnet_az1_cidr_block" {
  description = "CIDR block for the private data subnet in AZ1"
  type        = string
  default     = "10.0.5.0/24"
}

variable "private_data_subnet_az2_cidr_block" {
  description = "CIDR block for the private data subnet in AZ2"
  type        = string
  default     = "10.0.6.0/24"
}

variable "private_data_subnet_name_az1" {
  description = "Name tag for the private data subnet in AZ1"
  type        = string
  default     = "private-data-subnet-az1"
}

variable "private_data_subnet_name_az2" {
  description = "CIDR block for the public route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created"
  type        = string
}

variable "alb_sg_name" {
  description = "Name of the security group for the Application Load Balancer"
  type        = string
}

variable "bastion_sg_name" {
  description = "Name of the security group for the Bastion Host"
  type        = string
}

variable "app_server_sg_name" {
  description = "Name of the security group for the App Server"
  type        = string
}

variable "database_sg_name" {
  description = "Name of the security group for the Database"
  type        = string
}

variable "allowed_http_cidr_blocks" {
  description = "CIDR blocks allowed to access the ALB via HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_https_cidr_blocks" {
  description = "CIDR blocks allowed to access the ALB via HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to access the Bastion Host via SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "custom_ingress_from_port" {
  description = "The starting port for custom ingress to the database"
  type        = number
  default     = 0
}

variable "custom_ingress_to_port" {
  description = "The ending port for custom ingress to the database"
  type        = number
  default     = 0
}

variable "custom_ingress_protocol" {
  description = "The protocol for custom ingress to the database"
  type        = string
  default     = "tcp"
}

variable "custom_ingress_security_groups" {
  description = "Security groups allowed for custom ingress to the database"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "database_subnet_ids" {
  description = "List of subnet IDs for the database subnet group"
  type        = list(string)
}

variable "db_snapshot_identifier" {
  description = "Identifier for the DB snapshot"
  type        = string
  default     = false
}

variable "most_recent_snapshot" {
  description = "Boolean to indicate if the most recent snapshot should be used"
  type        = bool
  default     = true
}

variable "snapshot_type" {
  description = "Type of DB snapshot (e.g., automated, manual)"
  type        = string
  default     = "automated"
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance (e.g., db.t2.micro)"
  type        = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when the DB instance is deleted"
  type        = bool
  default     = true
}

variable "db_availability_zone" {
  description = "Availability zone where the DB instance will be launched"
  type        = string
}

variable "db_identifier" {
  description = "Identifier for the DB instance"
  type        = string
}

variable "multi_az" {
  description = "Whether to deploy the DB instance in multiple availability zones"
  type        = bool
  default     = false
}

variable "db_vpc_security_group_ids" {
  description = "List of VPC security group IDs associated with the DB instance"
  type        = list(string)
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "alb_internal" {
  description = "Whether the load balancer is internal"
  type        = bool
}

variable "alb_type" {
  description = "Type of load balancer (application, network)"
  type        = string
  default     = "application"
}

variable "alb_security_groups" {
  description = "List of security groups to associate with the load balancer"
  type        = list(string)
}

variable "alb_subnets" {
  description = "List of subnets to associate with the load balancer"
  type        = list(string)
}

variable "alb_enable_deletion_protection" {
  description = "Whether to enable deletion protection on the load balancer"
  type        = bool
  default     = false
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_type" {
  description = "Target type for the target group (instance, ip)"
  type        = string
}

variable "target_group_port" {
  description = "Port on which the targets receive traffic"
  type        = number
}

variable "target_group_protocol" {
  description = "Protocol for the target group (HTTP, HTTPS, TCP)"
  type        = string
}



variable "health_check_healthy_threshold" {
  description = "Number of consecutive health checks successes required to consider the target healthy"
  type        = number
  default     = 5
}

variable "health_check_interval" {
  description = "Interval in seconds between health checks"
  type        = number
  default     = 30
}

variable "health_check_matcher" {
  description = "HTTP codes to use when checking for a successful response"
  type        = string
  default     = "200,301,302"
}

variable "health_check_path" {
  description = "Path to request on the target for health checks"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Port to use for health checks"
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Protocol to use for health checks"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "How long to wait when receiving a response from the health check"
  type        = number
  default     = 5
}

variable "health_check_unhealthy_threshold" {
  description = "Number of consecutive health check failures required to consider a target unhealthy"
  type        = number
  default     = 2
}

variable "http_listener_port" {
  description = "Port for the HTTP listener"
  type        = number
  default     = 80
}

variable "http_listener_protocol" {
  description = "Protocol for the HTTP listener"
  type        = string
  default     = "HTTP"
}

variable "https_listener_port" {
  description = "Port for the HTTPS listener"
  type        = number
  default     = 443
}

variable "https_listener_protocol" {
  description = "Protocol for the HTTPS listener"
  type        = string
  default     = "HTTPS"
}

variable "certificate_arn" {
  description = "ARN of the certificate to use for the HTTPS listener"
  type        = string
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "sns_subscription_protocol" {
  description = "Protocol for the SNS topic subscription (e.g., email, sms, http)"
  type        = string
}

variable "sns_subscription_endpoint" {
  description = "Endpoint for the SNS topic subscription (e.g., email address, phone number, URL)"
  type        = string
}


variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "launch_template_image_id" {
  description = "ID of the AMI to launch"
  type        = string
}

variable "launch_template_instance_type" {
  description = "Instance type for the launch template"
  type        = string
}

variable "launch_template_key_name" {
  description = "Key pair name for the launch template"
  type        = string
}

variable "launch_template_description" {
  description = "Description of the launch template"
  type        = string
}

variable "launch_template_monitoring_enabled" {
  description = "Whether to enable monitoring for instances launched from the template"
  type        = bool
}

variable "launch_template_security_group_ids" {
  description = "List of security group IDs to associate with instances launched from the template"
  type        = list(string)
}


variable "asg_vpc_zone_identifier" {
  description = "List of subnet IDs to launch instances into"
  type        = list(string)
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "asg_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

variable "asg_health_check_type" {
  description = "Health check type for the Auto Scaling group (e.g., EC2, ELB)"
  type        = string
}

variable "asg_tag_key" {
  description = "Key of the tag to apply to instances launched by the Auto Scaling group"
  type        = string
}

variable "asg_tag_value" {
  description = "Value of the tag to apply to instances launched by the Auto Scaling group"
  type        = string
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group to attach the Auto Scaling group to"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic to send notifications to"
  type        = string
}
