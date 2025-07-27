variable "application_name" {
  type        = string
  description = "Application name"
}

variable "postgres_jdbc" {
  type        = string
  description = "Postgres JDBC URL"
}

variable "postgres_user" {
  type        = string
  description = "Postgres user"
}

variable "postgres_password" {
  type        = string
  description = "Postgres password"
  sensitive   = true
}
