module "db" {
  source                                       = "./modules/db"
  db_subnet_group_name                         = var.db_subnet_group_name
  tfe_postgres_sg_name                         = var.tfe_postgres_sg_name
  aws_security_group_tfe_postgres_tag_name     = var.aws_security_group_tfe_postgres_tag_name
  db_allocated_storage                         = var.db_allocated_storage
  db_storage_type                              = var.db_storage_type
  db_engine                                    = var.db_engine
  db_version                                   = var.db_version
  db_instance_class                            = var.db_instance_class
  db_name                                      = var.db_name
  db_username                                  = var.db_username
  db_password                                  = var.db_password
  db_port                                      = var.db_port
  aws_db_subnet_group_postgres_subnet_tag_name = var.aws_db_subnet_group_postgres_subnet_tag_name
  vpc_id                                       = module.vpc.vpc_id
  first_db_subnet                              = module.vpc.first_db_subnet
  second_db_subnet                             = module.vpc.second_db_subnet
}

output "postgres_name" {
  value       = module.db.postgres_name
  description = "Output of module db - Postgres database name"
}

output "postgres_hostname" {
  value       = module.db.postgres_hostname
  description = "Output of module db - Postgres database hostname"
}