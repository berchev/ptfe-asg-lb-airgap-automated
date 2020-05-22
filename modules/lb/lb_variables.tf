variable "vpc_id" {
  description = "VPC id in which lb is resided"
}

variable "lb_name" {
  description = "name of the lb"
}

variable "lb_first_subnet" {
  description = "first public subnet of the lb"
}

variable "lb_second_subnet" {
  description = "second public subnet of the lb"
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
