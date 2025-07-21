variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets (AZs)"
  type        = number
  default     = 3
}

variable "private_subnet_count" {
  description = "Number of private subnets (AZs)"
  type        = number
  default     = 3
}

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for NAT"
  type        = string
  default     = "t2.micro"
}
