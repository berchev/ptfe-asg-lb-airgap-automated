# Creating security group and rule for Postgers Database 
resource "aws_security_group" "tfe_postgres" {
  name   = var.tfe_postgres_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.aws_security_group_tfe_postgres_tag_name
  }
}
