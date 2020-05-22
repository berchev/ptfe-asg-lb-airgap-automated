output "vpc_id" {
  value       = aws_vpc.tfe_vpc.id
  description = "VPC ID output"
}

output "first_db_subnet" {
  value       = aws_subnet.first_db_subnet.id
  description = "first_db_subnet id"
}

output "second_db_subnet" {
  value       = aws_subnet.second_db_subnet.id
  description = "second_db_subnet id"
}

output "lb_first_public_subnet" {
  value       = aws_subnet.lb_first_public_subnet.id
  description = "lb_first_public_subnet id"
}

output "lb_second_public_subnet" {
  value       = aws_subnet.lb_second_public_subnet.id
  description = "lb_second_public_subnet id"
}

output "tfe_first_public_subnet" {
  value       = aws_subnet.tfe_first_public_subnet.id
  description = "tfe_first_public_subnet id"
}

output "tfe_second_public_subnet" {
  value       = aws_subnet.tfe_second_public_subnet.id
  description = "tfe_second_public_subnet id"
}

output "tfe_first_private_subnet" {
  value       = aws_subnet.tfe_first_private_subnet.id
  description = "tfe_first_private_subnet id"
}

output "tfe_second_private_subnet" {
  value       = aws_subnet.tfe_second_private_subnet.id
  description = "tfe_second_private_subnet id"
}