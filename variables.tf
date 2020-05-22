############################
#    AWS Authentication    #
############################
variable "access_key" {
  description = "Your AWS access key ID"
}

variable "secret_key" {
  description = "Your AWS secret key ID"
}

variable "aws_region" {
  description = "AWS default region"
}

###################
#    S3 BUCKET    #
###################
variable "data_bucket_name" {
  description = "Name of the data bucket"
}

variable "aws_s3_bucket_tfe_bucket_data_tag_name" {
  description = "Tag Name of the data bucket"
}

variable "snapshot_bucket_name" {
  description = "Name of the data bucket"
}

variable "aws_s3_bucket_tfe_bucket_snapshots_tag_name" {
  description = "Tag Name of the snapshot bucket"
}
#####################
#     DNS RECORD    #
#####################
variable "dns_zone_name" {
  description = "Name of my AWS hosted zone"
}

variable "dns_name_tfe" {
  description = "DNS Name of tfe instance"
}

#####################
#    DB POSTGRES    #
##################### 
variable "db_subnet_group_name" {
  description = "AWS database subnet group name"
}

variable "tfe_postgres_sg_name" {
  description = "AWS database postgres security group name"
}

variable "aws_security_group_tfe_postgres_tag_name" {
  description = "AWS database postgres security group tag name"
}

variable "db_allocated_storage" {
  description = "Storage attached to Postgres database"
}

variable "db_storage_type" {
  description = "Storage type of Postgres database"
}

variable "db_engine" {
  description = "Database engine kind"
}

variable "db_version" {
  description = "AWS Database version"
}

variable "db_instance_class" {
  description = "AWS database size characteristics"
}

variable "db_name" {
  description = "AWS database name"
}

variable "db_username" {
  description = "AWS database username"
}

variable "db_password" {
  description = "AWS database password"
}

variable "db_port" {
  description = "AWS database default port"
}

variable "aws_db_subnet_group_postgres_subnet_tag_name" {
  description = "all DB subnets assigned to the Postgres database"
}
############
#    ASG   #
############
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

variable "airgap_package" {
  description = "Desired tfe Airgap package"
}

variable "tfe_instance_password" {
  description = "Password of tfe instance"
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

#############
#    VPC    #
#############
variable "vpc_cidr_block" {
  description = "CIDR block of VPC"
}

variable "aws_vpc_tfe_vpc_tag_name" {
  description = "Tag name for tfe VPC"
}

variable "aws_internet_gateway_tfe_gw_tag_name" {
  description = "Tag name for tfe internet gateway"
}

variable "vpc_route_table_cidr_block" {
  description = "CIDR block of the VPC route table"
}

variable "tfe_private_route_table_cidr_block" {
  description = "CIDR block of the VPC route table"
}

variable "aws_route_table_tfe_route_table_tag_name" {
  description = "Tag name of the public route table"
}

variable "aws_route_table_tfe_private_route_table1_tag_name" {
  description = "Tag name of the first tfe private route table"
}

variable "aws_route_table_tfe_private_route_table2_tag_name" {
  description = "Tag name of the second tfe private route table"
}

variable "first_db_subnet_cidr_block" {
  description = "CIDR block of the first subnet"
}

variable "aws_subnet_first_db_subnet_tag_name" {
  description = "Tag name of the first subnet"
}

variable "second_db_subnet_cidr_block" {
  description = "CIDR block of the second subnet"
}

variable "aws_subnet_second_db_subnet_tag_name" {
  description = "Tag name of the second subnet"
}

variable "lb_first_subnet_cidr_block" {
  description = "CIDR block of the first lb public subnet"
}

variable "aws_subnet_lb_first_public_subnet_tag_name" {
  description = "Tag name of the lb public subnet"
}

variable "lb_second_subnet_cidr_block" {
  description = "CIDR block of the second lb public subnet"
}

variable "aws_subnet_lb_second_public_subnet_tag_name" {
  description = "Tag name of the second lb public subnet"
}

variable "tfe_first_public_subnet_cidr_block" {
  description = "CIDR block of the forth subnet"
}

variable "aws_subnet_tfe_first_public_subnet_tag_name" {
  description = "Tag name of the tfe public subnet"
}

variable "tfe_second_public_subnet_cidr_block" {
  description = "CIDR block of the second tfe public subnet"
}

variable "aws_subnet_tfe_second_public_subnet_tag_name" {
  description = "Tag name of the second tfe public subnet"
}
variable "tfe_first_private_subnet_cidr_block" {
  description = "CIDR block of the tfe first private subnet"
}

variable "aws_subnet_tfe_first_private_subnet_tag_name" {
  description = "Tag name of the tfe private subnet"
}

variable "tfe_second_private_subnet_cidr_block" {
  description = "CIDR block of the tfe second private subnet"
}

variable "aws_subnet_tfe_second_private_subnet_tag_name" {
  description = "Tag name of the tfe second private subnet"
}

#######################
#    LOAD BALANCER    #
#######################
variable "lb_name" {
  description = "name of the lb"
}
variable "aws_lb_tfe_lb_tag_name" {
  description = "lb tag name"
}

variable "port_443_tg_name" {
  description = "lb port 443 target group name"
}

variable "port_80_tg_name" {
  description = "lb port 80 target group name"
}

variable "port_22_tg_name" {
  description = "lb port 22 target group name"
}

variable "port_8800_tg_name" {
  description = "lb port 8800 target group name"
}