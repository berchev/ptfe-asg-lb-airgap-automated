module "r53" {
  source        = "./modules/r53"
  dns_zone_name = var.dns_zone_name
  dns_name_tfe  = var.dns_name_tfe
  lb_dns_name   = module.lb.aws_lb_dns_name
}

output "tfe_website_url" {
  value       = module.r53.tfe_website_url
  description = "TFE website URL"
}