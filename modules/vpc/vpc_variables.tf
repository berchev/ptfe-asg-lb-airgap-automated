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
  description = "CIDR block of the route table"
}

variable "tfe_private_route_table_cidr_block" {
  description = "CIDR block of the TFE private route table"
}

variable "aws_route_table_tfe_route_table_tag_name" {
  description = "Tag name of the route table"
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
  description = "CIDR block of the first lb subnet"
}

variable "lb_second_subnet_cidr_block" {
  description = "CIDR block of the second lb subnet"
}

variable "aws_subnet_lb_first_public_subnet_tag_name" {
  description = "Tag name of the first lb subnet"
}

variable "aws_subnet_lb_second_public_subnet_tag_name" {
  description = "Tag name of the second lb subnet"
}

variable "tfe_first_public_subnet_cidr_block" {
  description = "CIDR block of the first tfe public subnet"
}

variable "tfe_first_private_subnet_cidr_block" {
  description = "CIDR block of the tfe private subnet"
}

variable "aws_subnet_tfe_first_private_subnet_tag_name" {
  description = "Tag name of the tfe first private subnet"
}

variable "tfe_second_private_subnet_cidr_block" {
  description = "CIDR block of the tfe second private subnet"
}

variable "aws_subnet_tfe_second_private_subnet_tag_name" {
  description = "Tag name of the tfe second private subnet"
}

variable "aws_subnet_tfe_first_public_subnet_tag_name" {
  description = "Tag name of the first tfe public subnet"
}


variable "tfe_second_public_subnet_cidr_block" {
  description = "CIDR block of the second tfe public subnet"
}

variable "aws_subnet_tfe_second_public_subnet_tag_name" {
  description = "Tag name of the second tfe public subnet"
}
