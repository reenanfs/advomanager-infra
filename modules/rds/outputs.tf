output "rds_endpoint" {
  description = "The RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "rds_jdbc_url" {
  description = "Full JDBC connection string"
  value       = "jdbc:postgresql://${aws_db_instance.this.endpoint}/${var.db_name}"
}

output "rds_security_group_id" {
  description = "RDS Security Group ID"
  value       = aws_security_group.rds.id
}
