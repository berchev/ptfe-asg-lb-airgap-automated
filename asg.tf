module "asg" {
  source                                 = "./modules/asg"
  aws_region                             = var.aws_region
  tfe_instance_role_name                 = var.tfe_instance_role_name
  aws_tfe_instance_security_group_name   = var.aws_tfe_instance_security_group_name
  aws_security_group_name                = var.aws_security_group_name
  aws_security_group_tfe_sg_tag_name     = var.aws_security_group_tfe_sg_tag_name
  tfe_instance_policy_name               = var.tfe_instance_policy_name
  tfe_instance_profile_name              = var.tfe_instance_profile_name
  dns_name_tfe                           = var.dns_name_tfe
  airgap_package                         = var.airgap_package
  db_password                            = var.db_password
  tfe_instance_password                  = var.tfe_instance_password
  db_username                            = var.db_username
  db_name                                = var.db_name
  data_bucket_name                       = var.data_bucket_name
  snapshot_bucket_name                   = var.snapshot_bucket_name
  tfe_airgap_bucket_location             = var.tfe_airgap_bucket_location
  replicated_tar                         = var.replicated_tar
  access_key                             = var.access_key
  secret_key                             = var.secret_key
  ami                                    = var.ami
  instance_type                          = var.instance_type
  key_name                               = var.key_name
  aws_autoscaling_group_name             = var.aws_autoscaling_group_name
  aws_autoscaling_group_tfe_asg_tag_name = var.aws_autoscaling_group_tfe_asg_tag_name
  tfe_instance_volume_size               = var.tfe_instance_volume_size
  vpc_id                                 = module.vpc.vpc_id
  pg_netloc                              = module.db.postgres_hostname
  tfe_first_private_subnet               = module.vpc.tfe_first_private_subnet
  tfe_second_private_subnet              = module.vpc.tfe_second_private_subnet
  lb_target_group_443_arn                = module.lb.tg-443-arn
  lb_target_group_80_arn                 = module.lb.tg-80-arn
  lb_target_group_22_arn                 = module.lb.tg-22-arn
  lb_target_group_8800_arn               = module.lb.tg-8800-arn
}

output "tfe_asg_name" {
  value       = module.asg.tfe_asg_name
  description = "Name of created TFE ASG"
}