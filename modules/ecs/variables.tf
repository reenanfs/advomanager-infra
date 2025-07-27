variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS Cluster"
}

variable "task_family" {
  type        = string
  description = "ECS task definition family"
}

variable "task_cpu" {
  type        = number
  description = "CPU units for the ECS task"
}

variable "task_memory" {
  type        = number
  description = "Memory (in MiB) for the ECS task"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "container_image" {
  type        = string
  description = "Docker image URL for the container"
}

variable "container_cpu" {
  type        = number
  description = "CPU units reserved for the container"
}

variable "container_memory" {
  type        = number
  description = "Memory (in MiB) reserved for the container"
}

variable "container_port" {
  type        = number
  description = "Port the container exposes"
}

variable "log_group_name" {
  type        = string
  description = "CloudWatch Logs group name"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "task_execution_role_arn" {
  type        = string
  description = "ARN of the task execution IAM role"
}

variable "service_name" {
  type        = string
  description = "ECS Service name"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "Target group ARN for load balancing"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks"
}

variable "autoscaling_group_arn" {
  type        = string
  description = "EC2 Autoscaling Group arn used in ec2"
}

variable "alb_security_group_id" {
  description = "Security group ID of the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where RDS will be created"
  type        = string
}

variable "ssm_application_name_arn" {
  description = "ARN of SSM parameter for APPLICATION_NAME"
  type        = string
}

variable "ssm_postgres_jdbc_arn" {
  description = "ARN of SSM parameter for POSTGRES_JDBC"
  type        = string
}

variable "ssm_postgres_user_arn" {
  description = "ARN of SSM parameter for POSTGRES_USER"
  type        = string
}

variable "ssm_postgres_password_arn" {
  description = "ARN of SSM parameter for POSTGRES_PASSWORD"
  type        = string
}
