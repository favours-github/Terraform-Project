# Create Security Group for the Application Load Balancer
resource "aws_security_group" "alb_security_group" {
  name        = var.alb_sg_name
  description = "enable http/https access on port 80/443"
  vpc_id      = var.vpc_id

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.allowed_http_cidr_blocks
  }

  ingress {
    description      = "https access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.allowed_https_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.alb_sg_name
  }
}

# Create Security Group for the Bastion Host (Jump Box)
resource "aws_security_group" "bastion_security_group" {
  name        = var.bastion_sg_name
  description = "enable ssh access on port 22"
  vpc_id      = var.vpc_id

  ingress {
    description      = "ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.allowed_ssh_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.bastion_sg_name
  }
}

# Create Security Group for the App Server
resource "aws_security_group" "app_server_security_group" {
  name        = var.app_server_sg_name
  description = "enable http/https access on port 80/443 via alb sg"
  vpc_id      = var.vpc_id

  ingress {
    description      = "http access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description      = "https access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb_security_group.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.app_server_sg_name
  }
}

# Create Security Group for the Database
resource "aws_security_group" "database_security_group" {
  name        = var.database_sg_name
  description = "enable mysql/aurora access on port 3306"
  vpc_id      = var.vpc_id

  ingress {
    description      = "mysql/aurora access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.app_server_security_group.id]
  }

  ingress {
    description      = "custom access"
    from_port        = var.custom_ingress_from_port
    to_port          = var.custom_ingress_to_port
    protocol         = var.custom_ingress_protocol
    security_groups  = var.custom_ingress_security_groups
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.database_sg_name
  }
}
