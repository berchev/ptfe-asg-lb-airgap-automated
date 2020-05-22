
resource "aws_s3_bucket" "tfe_bucket_data" {
  bucket = var.data_bucket_name

  tags = {
    Name = var.aws_s3_bucket_tfe_bucket_data_tag_name
  }
}

resource "aws_s3_bucket_public_access_block" "tfe_bucket_data_permissions" {
  bucket = aws_s3_bucket.tfe_bucket_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "tfe_bucket_snapshots" {
  bucket = var.snapshot_bucket_name

  tags = {
    Name = var.aws_s3_bucket_tfe_bucket_snapshots_tag_name
  }
}

resource "aws_s3_bucket_public_access_block" "tfe_bucket_snapshots_permissions" {
  bucket = aws_s3_bucket.tfe_bucket_snapshots.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
