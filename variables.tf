variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "Project name prefix for resource naming"
  type        = string
  default     = "advomanager"
}

variable "ec2_instance_type" {
  description = "EC2 instance type for ECS container instances"
  type        = string
  default     = "t2.micro"
}

variable "postgres_user" {
  description = "Postgres database user"
  type        = string
}

variable "postgres_password" {
  description = "Postgres database password"
  type        = string
  sensitive   = true
}
