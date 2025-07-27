resource "aws_ssm_parameter" "application_name" {
  name  = "/${var.application_name}/application_name"
  type  = "String"
  value = var.application_name
}

resource "aws_ssm_parameter" "postgres_jdbc" {
  name  = "/${var.application_name}/postgres_jdbc"
  type  = "String"
  value = var.postgres_jdbc
}

resource "aws_ssm_parameter" "postgres_user" {
  name  = "/${var.application_name}/postgres_user"
  type  = "String"
  value = var.postgres_user
}

resource "aws_ssm_parameter" "postgres_password" {
  name      = "/${var.application_name}/postgres_password"
  type      = "SecureString"
  value     = var.postgres_password
  overwrite = true
}
