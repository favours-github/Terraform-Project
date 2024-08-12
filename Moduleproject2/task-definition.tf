# Create ECS cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-${var.environment}-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

# Create CloudWatch log group
resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/${var.project_name}-${var.environment}-td"

  lifecycle {
    create_before_destroy = true
  }
}

# Create ECS task definition
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.project_name}-${var.environment}-td"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  # Create container definition
  container_definitions = jsonencode([
    {
      name      = "${var.project_name}-${var.environment}-container"
      image     = "${var.container_image}"
      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

      environmentFiles = [
        {
          value = "arn:aws:s3:::${var.project_name}-${var.environment}/${var.env_file}"
          type  = "s3"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-group"         = "/ecs/${var.project_name}-${var.environment}-td",
          "awslogs-region"        = var.aws_region,
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

# Create ECS service
resource "aws_ecs_service" "ecs_service" {
  name                               = "${var.project_name}-${var.environment}-service"
  launch_type                        = "FARGATE"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.ecs_task_definition.arn
  platform_version                   = "LATEST"
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  # Task tagging configuration
  enable_ecs_managed_tags = true
  propagate_tags          = "SERVICE"

  # VPC and security groups
  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }

  # Load balancing
  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "${var.project_name}-${var.environment}-container"
    container_port   = 80
  }
}
