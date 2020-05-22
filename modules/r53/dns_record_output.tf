output "tfe_website_url" {
  value       = aws_route53_record.www.name
  description = "TFE website URL"
}