provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      "Automation"  = var.automation_tag
      "Project"     = var.project_tag
      "Environment" = var.environment_tag
    }
  }
}
