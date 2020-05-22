module "vpc" {
  source                                            = "./modules/vpc"
  vpc_cidr_block                                    = var.vpc_cidr_block
  aws_vpc_tfe_vpc_tag_name                          = var.aws_vpc_tfe_vpc_tag_name
  aws_internet_gateway_tfe_gw_tag_name              = var.aws_internet_gateway_tfe_gw_tag_name
  vpc_route_table_cidr_block                        = var.vpc_route_table_cidr_block
  tfe_private_route_table_cidr_block                = var.tfe_private_route_table_cidr_block
  aws_route_table_tfe_route_table_tag_name          = var.aws_route_table_tfe_route_table_tag_name
  aws_route_table_tfe_private_route_table1_tag_name = var.aws_route_table_tfe_private_route_table1_tag_name
  aws_route_table_tfe_private_route_table2_tag_name = var.aws_route_table_tfe_private_route_table2_tag_name
  first_db_subnet_cidr_block                        = var.first_db_subnet_cidr_block
  aws_subnet_first_db_subnet_tag_name               = var.aws_subnet_first_db_subnet_tag_name
  second_db_subnet_cidr_block                       = var.second_db_subnet_cidr_block
  aws_subnet_second_db_subnet_tag_name              = var.aws_subnet_second_db_subnet_tag_name
  lb_first_subnet_cidr_block                        = var.lb_first_subnet_cidr_block
  aws_subnet_lb_first_public_subnet_tag_name        = var.aws_subnet_lb_first_public_subnet_tag_name
  lb_second_subnet_cidr_block                       = var.lb_second_subnet_cidr_block
  aws_subnet_lb_second_public_subnet_tag_name       = var.aws_subnet_lb_second_public_subnet_tag_name
  tfe_first_public_subnet_cidr_block                = var.tfe_first_public_subnet_cidr_block
  aws_subnet_tfe_first_public_subnet_tag_name       = var.aws_subnet_tfe_first_public_subnet_tag_name
  tfe_second_public_subnet_cidr_block               = var.tfe_second_public_subnet_cidr_block
  aws_subnet_tfe_second_public_subnet_tag_name      = var.aws_subnet_tfe_second_public_subnet_tag_name
  tfe_first_private_subnet_cidr_block               = var.tfe_first_private_subnet_cidr_block
  aws_subnet_tfe_first_private_subnet_tag_name      = var.aws_subnet_tfe_first_private_subnet_tag_name
  tfe_second_private_subnet_cidr_block              = var.tfe_second_private_subnet_cidr_block
  aws_subnet_tfe_second_private_subnet_tag_name     = var.aws_subnet_tfe_second_private_subnet_tag_name
}

output "first_db_subnet" {
  value       = module.vpc.first_db_subnet
  description = "first_db_subnet id"
}

output "second_db_subnet" {
  value       = module.vpc.second_db_subnet
  description = "second_db_subnet id"
}

output "lb_first_public_subnet" {
  value       = module.vpc.lb_first_public_subnet
  description = "lb_first_public_subnet id"
}

output "lb_second_public_subnet" {
  value       = module.vpc.lb_second_public_subnet
  description = "lb_second_public_subnet id"
}

output "tfe_first_public_subnet" {
  value       = module.vpc.tfe_first_public_subnet
  description = "tfe_first_public_subnet id"
}

output "tfe_second_public_subnet" {
  value       = module.vpc.tfe_second_public_subnet
  description = "tfe_second_public_subnet id"
}

output "tfe_first_private_subnet" {
  value       = module.vpc.tfe_first_private_subnet
  description = "tfe_first_private_subnet id"
}

output "tfe_second_private_subnet" {
  value       = module.vpc.tfe_second_private_subnet
  description = "tfe_second_private_subnet id"
}