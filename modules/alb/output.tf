output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.this.dns_name
}

output "target_group_arn" {
  description = "Target group ARN to attach to ECS service"
  value       = aws_lb_target_group.this.arn
}

output "security_group_id" {
  description = "ALB security group ID"
  value       = aws_security_group.alb_sg.id
}
