module "s3" {
  source                                      = "./modules/s3"
  data_bucket_name                            = var.data_bucket_name
  aws_s3_bucket_tfe_bucket_data_tag_name      = var.aws_s3_bucket_tfe_bucket_data_tag_name
  snapshot_bucket_name                        = var.snapshot_bucket_name
  aws_s3_bucket_tfe_bucket_snapshots_tag_name = var.aws_s3_bucket_tfe_bucket_snapshots_tag_name
}

output "data_bucket_name" {
  value       = module.s3.data_bucket_name
  description = "The name of the data bucket"
}

output "snapshot_bucket_name" {
  value       = module.s3.snapshot_bucket_name
  description = "The name of the snapshot bucket"
}