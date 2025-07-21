output "ecs_instance_role_name" {
  description = "IAM role name for ECS EC2 instances"
  value       = aws_iam_role.ecs_instance_role.name
}

output "ecs_instance_profile_name" {
  description = "Instance profile name for EC2 launch configuration"
  value       = aws_iam_instance_profile.ecs_instance_profile.name
}

output "ecs_task_execution_role_arn" {
  description = "ARN of ECS task execution role"
  value       = aws_iam_role.ecs_task_execution_role.arn
}
