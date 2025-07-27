variable "ecs_instance_role_name" {
  description = "IAM role name for ECS EC2 instances"
  type        = string
}

variable "ecs_task_execution_role_name" {
  description = "IAM role name for ECS task execution"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name prefix for resource naming"
  type        = string
}
