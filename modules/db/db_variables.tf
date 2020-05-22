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

variable "vpc_id" {
  description = "ID of created TFE VPC, passed among the modules. Will be known after creation."
}

variable "first_db_subnet" {
  description = "First db subnet, passed among the modules"
}

variable "second_db_subnet" {
  description = "Second db subnet, passed among the modules"
}
