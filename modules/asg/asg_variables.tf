variable "aws_region" {
  description = "AWS default region"
}

variable "tfe_instance_role_name" {
  description = "Name of the tfe_instance role"
}

variable "tfe_instance_policy_name" {
  description = "Name of the tfe_instance policy"
}

variable "tfe_instance_profile_name" {
  description = "Name of the tfe_instance profile"
}

variable "aws_security_group_name" {
  description = " tfe security group"
}

variable "aws_security_group_tfe_sg_tag_name" {
  description = "Tag name of the tfe security group"
}

variable "aws_tfe_instance_security_group_name" {
  description = "Dedicated security group for tfe instance"
}

variable "dns_name_tfe" {
  description = "DNS Name of tfe instance"
}

variable "airgap_package" {
  description = "Desired tfe Airgap package"
}

variable "db_password" {
  description = "AWS database password"
}

variable "tfe_instance_password" {
  description = "Password of tfe instance"
}

variable "db_username" {
  description = "AWS database username"
}

variable "data_bucket_name" {
  description = "Name of the data bucket"
}

variable "snapshot_bucket_name" {
  description = "Name of the data bucket"
}

variable "tfe_airgap_bucket_location" {
  description = "TFE Airgap package need to be located in S3 Assets Bucket. Please specify the s3 bucket path"
}

variable "replicated_tar" {
  description = "Latest/Stable version of replicated package located in S3 Assets Bucket"
}

variable "ami" {
  description = "AWS ami according to the region"
}

variable "instance_type" {
  description = "AWS instance size characteristics"
}

variable "key_name" {
  description = "AWS key pair name"
}

variable "aws_autoscaling_group_name" {
  description = "Name of AWS tfe asg"
}

variable "aws_autoscaling_group_tfe_asg_tag_name" {
  description = "Tag name of AWS tfe asg"
}

variable "tfe_instance_volume_size" {
  description = "Root volume size of the tfe instance"
}

variable "vpc_id" {
  description = "ID of created TFE VPC, passed among the modules. Will be known after creation."
}

variable "db_name" {
  description = "AWS database name"
}

variable "pg_netloc" {
  description = "AWS database hostname and port. Should be known after creation"
}

variable "lb_target_group_443_arn" {
  description = "lb target group arn for port 443"
}

variable "lb_target_group_80_arn" {
  description = "lb target group arn for port 80"
}

variable "lb_target_group_22_arn" {
  description = "lb target group arn for port 22"
}

variable "lb_target_group_8800_arn" {
  description = "lb target group arn for port 8800"
}

variable "tfe_first_private_subnet" {
  description = "first private subnet for tfe instance"
}

variable "tfe_second_private_subnet" {
  description = "second private subnet for tfe instance"
}

variable "access_key" {
  description = "access key"
}

variable "secret_key" {
  description = "secret key"
}