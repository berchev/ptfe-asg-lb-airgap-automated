output "data_bucket_name" {
  value       = aws_s3_bucket.tfe_bucket_data.id
  description = "The name of the data bucket"
}

output "snapshot_bucket_name" {
  value       = aws_s3_bucket.tfe_bucket_snapshots.id
  description = "The name of the snapshot bucket"
}