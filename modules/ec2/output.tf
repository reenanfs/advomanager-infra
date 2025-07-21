output "autoscaling_group_arn" {
  description = "The arn of the Auto Scaling Group"
  value       = aws_autoscaling_group.ecs.arn
}

output "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.ecs.name
}
