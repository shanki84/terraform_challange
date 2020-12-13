resource "aws_vpc" "vpc_main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name      = "VPC"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name      = "Private Subnet"
   }
}

# adding internet gateway for external communication
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name      = "Internet Gateway"
  }
}

# adding an elastic IP
resource "aws_eip" "elastic_ip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateway]
}

# creating the NAT gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.private_subnet.id
  depends_on    = [aws_internet_gateway.internet_gateway]
}

# creating private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_main.id

  tags {
    Name      = "Private Subnet Route Table"
  }
}

# adding private route table to nat
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${ aws_nat_gateway.nat.id }"
}