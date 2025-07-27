output "application_name_param_arn" {
  value = aws_ssm_parameter.application_name.arn
}

output "postgres_jdbc_param_arn" {
  value = aws_ssm_parameter.postgres_jdbc.arn
}

output "postgres_user_param_arn" {
  value = aws_ssm_parameter.postgres_user.arn
}

output "postgres_password_param_arn" {
  value = aws_ssm_parameter.postgres_password.arn
}
