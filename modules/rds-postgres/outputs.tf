output "endpoint" {
  description = "Connection endpoint (host:port)."
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "Hostname of the instance."
  value       = aws_db_instance.this.address
}

output "port" {
  description = "Port of the instance."
  value       = aws_db_instance.this.port
}

output "security_group_id" {
  description = "Security group attached to the database."
  value       = aws_security_group.this.id
}

output "master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret holding the master credentials."
  value       = aws_db_instance.this.master_user_secret[0].secret_arn
}
