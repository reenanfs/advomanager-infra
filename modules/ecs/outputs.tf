output "cluster_id" {
  description = "ID of the ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.this.arn
}

output "service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.this.name
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "ecs_capacity_provider_name" {
  description = "The ECS Capacity Provider name"
  value       = aws_ecs_capacity_provider.this.name
}
