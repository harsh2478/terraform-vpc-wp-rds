resource "aws_route_table" "second-rt" {
        vpc_id = aws_vpc.vpc.id
        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = aws_internet_gateway.igw.id
        }

        tags = {
                Name = "Public-route-table"
        }
}

resource "aws_route_table_association" "public-subnets-asso" {
        count = length(var.public_subnet_cidrs)
        subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
        route_table_id = aws_route_table.second-rt.id
}

resource "aws_route_table" "third-rt" {
  vpc_id = aws_vpc.vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "private-subnet-rt"
  }
}


resource "aws_route_table_association" "private-subnets-asso" {
        count = length(var.private_subnet_cidrs)
        subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
        route_table_id = aws_route_table.third-rt.id
}
