output "postgres_name" {
  value       = aws_db_instance.postgres.name
  description = "Postgres name"
}

output "postgres_hostname" {
  value       = aws_db_instance.postgres.endpoint
  description = "Postgres hostname"
}