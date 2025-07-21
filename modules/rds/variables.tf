variable "name" {
  description = "Project or environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where RDS will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS subnet group"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID of ECS service that needs to access RDS"
  type        = string
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro" # cheapest with free tier
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "port" {
  type    = number
  default = 5432
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "backup_retention_period" {
  type    = number
  default = 1
}
