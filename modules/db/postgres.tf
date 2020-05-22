resource "aws_db_subnet_group" "postgres_subnet" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.first_db_subnet, var.second_db_subnet]


  tags = {
    Name = var.aws_db_subnet_group_postgres_subnet_tag_name
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage      = var.db_allocated_storage
  storage_type           = var.db_storage_type
  engine                 = var.db_engine
  engine_version         = var.db_version
  instance_class         = var.db_instance_class
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = var.db_port
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet.id
  vpc_security_group_ids = [aws_security_group.tfe_postgres.id]
  skip_final_snapshot    = true
}

