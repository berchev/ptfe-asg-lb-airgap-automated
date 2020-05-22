# Creating tfe dedicated VPC
resource "aws_vpc" "tfe_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_tfe_vpc_tag_name
  }
}

# All availability zones of the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating first subnet for the database
resource "aws_subnet" "first_db_subnet" {
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.first_db_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_first_db_subnet_tag_name
  }
}

# Creating second subnet for the database
resource "aws_subnet" "second_db_subnet" {
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.second_db_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_second_db_subnet_tag_name
  }
}

# Creating separate public subnets for the LB
resource "aws_subnet" "lb_first_public_subnet" {
  availability_zone = data.aws_availability_zones.available.names[2]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.lb_first_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_lb_first_public_subnet_tag_name
  }
}

resource "aws_subnet" "lb_second_public_subnet" {
  availability_zone = data.aws_availability_zones.available.names[3]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.lb_second_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_lb_second_public_subnet_tag_name
  }
}

# Creating separate public subnets for the TFE instance
resource "aws_subnet" "tfe_first_public_subnet" {
  availability_zone = data.aws_availability_zones.available.names[2]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.tfe_first_public_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_tfe_first_public_subnet_tag_name
  }
}

# Creating separate public subnets for the TFE instance
resource "aws_subnet" "tfe_second_public_subnet" {
  availability_zone = data.aws_availability_zones.available.names[3]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.tfe_second_public_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_tfe_second_public_subnet_tag_name
  }
}

resource "aws_subnet" "tfe_first_private_subnet" {
  availability_zone = data.aws_availability_zones.available.names[2]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.tfe_first_private_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_tfe_first_private_subnet_tag_name
  }
}

resource "aws_subnet" "tfe_second_private_subnet" {
  availability_zone = data.aws_availability_zones.available.names[3]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.tfe_second_private_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_tfe_second_private_subnet_tag_name
  }
}

#Creating gateway for specific VPC (In this way traffic from internet can go in/out of the VPC)
resource "aws_internet_gateway" "tfe_gw" {
  vpc_id = aws_vpc.tfe_vpc.id

  tags = {
    Name = var.aws_internet_gateway_tfe_gw_tag_name
  }
}

# Creating route table for specific VPC
resource "aws_route_table" "tfe_route_table" {
  vpc_id = aws_vpc.tfe_vpc.id

  route {
    cidr_block = var.vpc_route_table_cidr_block
    gateway_id = aws_internet_gateway.tfe_gw.id
  }

  tags = {
    Name = var.aws_route_table_tfe_route_table_tag_name
  }
}

# Assign route table to specific VPC
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.tfe_vpc.id
  route_table_id = aws_route_table.tfe_route_table.id
}

# Assign route table to Load Balancer Subnets, in order to make them public
resource "aws_route_table_association" "lb_subnet_association1" {
  subnet_id      = aws_subnet.lb_first_public_subnet.id
  route_table_id = aws_route_table.tfe_route_table.id
}

resource "aws_route_table_association" "lb_subnet_association2" {
  subnet_id      = aws_subnet.lb_second_public_subnet.id
  route_table_id = aws_route_table.tfe_route_table.id
}

# Assign route table to TFE Subnets, in order to make them public
resource "aws_route_table_association" "public_subnet_association1" {
  subnet_id      = aws_subnet.tfe_first_public_subnet.id
  route_table_id = aws_route_table.tfe_route_table.id
}

resource "aws_route_table_association" "public_subnet_association2" {
  subnet_id      = aws_subnet.tfe_second_public_subnet.id
  route_table_id = aws_route_table.tfe_route_table.id
}

#### ATTENTION !!! ####
# There are 2 ways to allow tfe instance to communicate with S3 Bucket
# - using VPC endpoint (negatives -> TFE instance should be in Public Subnet ). Consider the code below.

# resource "aws_vpc_endpoint" "s3" {
#   vpc_id       = aws_vpc.tfe_vpc.id
#   service_name = "com.amazonaws.us-east-1.s3"
# }

# resource "aws_vpc_endpoint_route_table_association" "main_rt" {
#   route_table_id  = aws_route_table.tfe_route_table.id
#   vpc_endpoint_id = aws_vpc_endpoint.s3.id
# }

# - using NAT GATEWAY  (Preffered method from me)
resource "aws_eip" "tfe_nat1" {
  vpc = true
}

resource "aws_eip" "tfe_nat2" {
  vpc = true
}

resource "aws_nat_gateway" "tfe_nat_gw1" {
  depends_on    = [aws_internet_gateway.tfe_gw]
  allocation_id = aws_eip.tfe_nat1.id
  subnet_id     = aws_subnet.tfe_first_public_subnet.id
}

resource "aws_nat_gateway" "tfe_nat_gw2" {
  depends_on    = [aws_internet_gateway.tfe_gw]
  allocation_id = aws_eip.tfe_nat2.id
  subnet_id     = aws_subnet.tfe_second_public_subnet.id
}

resource "aws_route_table" "tfe_private_route_table1" {
  vpc_id = aws_vpc.tfe_vpc.id

  route {
    cidr_block     = var.tfe_private_route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.tfe_nat_gw1.id
  }

  tags = {
    Name = var.aws_route_table_tfe_private_route_table1_tag_name
  }
}

resource "aws_route_table" "tfe_private_route_table2" {
  vpc_id = aws_vpc.tfe_vpc.id

  route {
    cidr_block     = var.tfe_private_route_table_cidr_block
    nat_gateway_id = aws_nat_gateway.tfe_nat_gw2.id
  }

  tags = {
    Name = var.aws_route_table_tfe_private_route_table2_tag_name
  }
}

resource "aws_route_table_association" "tfe_first_private_subnet_association" {
  subnet_id      = aws_subnet.tfe_first_private_subnet.id
  route_table_id = aws_route_table.tfe_private_route_table1.id
}

resource "aws_route_table_association" "tfe_second_private_subnet_association" {
  subnet_id      = aws_subnet.tfe_second_private_subnet.id
  route_table_id = aws_route_table.tfe_private_route_table2.id
}