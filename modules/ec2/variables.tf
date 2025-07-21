variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_profile_name" {
  description = "IAM instance profile name for ECS"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for launching EC2 instances"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups to attach to EC2 instances"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of EC2 instances in the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of EC2 instances in the ASG"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in the ASG"
  type        = number
  default     = 1
}
