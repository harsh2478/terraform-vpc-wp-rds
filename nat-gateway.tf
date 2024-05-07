resource "aws_eip" "ip" {
  domain = "vpc"
  tags = {
    Name = "elasticIP"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.ip.allocation_id 
  subnet_id     = aws_subnet.public_subnets[0].id


  tags = {
    Name = "nat-gateway"
  }
}



