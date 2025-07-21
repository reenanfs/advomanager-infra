variable "alb_name" {
  description = "Name for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "project_name" {
  description = "Project prefix for consistent naming"
  type        = string
}
