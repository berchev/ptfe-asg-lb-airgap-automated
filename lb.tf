module "lb" {
  source                 = "./modules/lb"
  lb_name                = var.lb_name
  aws_lb_tfe_lb_tag_name = var.aws_lb_tfe_lb_tag_name
  port_443_tg_name       = var.port_443_tg_name
  port_80_tg_name        = var.port_80_tg_name
  port_22_tg_name        = var.port_22_tg_name
  port_8800_tg_name      = var.port_8800_tg_name
  vpc_id                 = module.vpc.vpc_id
  lb_first_subnet        = module.vpc.lb_first_public_subnet
  lb_second_subnet       = module.vpc.lb_second_public_subnet
}

output "aws_lb_dns_name" {
  value       = module.lb.aws_lb_dns_name
  description = "Load Balancer DNS name"
}