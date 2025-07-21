output "vpc_id" {
  description = "VPC ID"
  value       = module.network.vpc_id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.alb_dns_name
}

output "ecr_repository_url" {
  description = "ECR Repository URL"
  value       = module.ecr.repository_url
}

# output "ecs_cluster_id" {
#   description = "ECS Cluster ID"
#   value       = module.ecs.cluster_id
# }

# output "ecs_service_name" {
#   description = "ECS Service name"
#   value       = module.ecs.service_name
# }
