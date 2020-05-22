output "tg-443-arn" {
  value       = aws_lb_target_group.tg-443.arn
  description = "Target group 443 arn"
}

output "tg-80-arn" {
  value       = aws_lb_target_group.tg-80.arn
  description = "Target group 80 arn"
}

output "tg-22-arn" {
  value       = aws_lb_target_group.tg-22.arn
  description = "Target group 22 arn"
}

output "tg-8800-arn" {
  value       = aws_lb_target_group.tg-8800.arn
  description = "Target group 8800 arn"
}

output "aws_lb_dns_name" {
  value       = aws_lb.tfe_lb.dns_name
  description = "Load Balancer DNS name"
}
