# Creating security group and rules for tfe instance
resource "aws_security_group" "tfe_sg" {
  name        = var.aws_security_group_name
  vpc_id      = var.vpc_id
  description = "Security group for tfe instance"

  tags = {
    Name = var.aws_security_group_tfe_sg_tag_name
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

resource "aws_security_group_rule" "replicated" {
  type              = "ingress"
  from_port         = 8800
  to_port           = 8800
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

# Additional ports
resource "aws_security_group_rule" "range_ports_1" {
  type              = "ingress"
  from_port         = 9870
  to_port           = 9880
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

resource "aws_security_group_rule" "range_ports_2" {
  type              = "ingress"
  from_port         = 23000
  to_port           = 23100
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

resource "aws_security_group_rule" "outbound_traffic" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.tfe_sg.id
}

