resource "aws_subnet" "public_subnets" {
        count = length(var.public_subnet_cidrs)
        vpc_id = aws_vpc.vpc.id
        availability_zone = element(var.aws_azs, count.index)
        cidr_block = element(var.public_subnet_cidrs, count.index)
	map_public_ip_on_launch = true

        tags = {
                Name = "public_subnet- ${count.index + 1}"
        }
}

resource "aws_subnet" "private_subnets" {
        count = length(var.private_subnet_cidrs)
        vpc_id = aws_vpc.vpc.id
        availability_zone = element(var.aws_azs, count.index)
        cidr_block = element(var.private_subnet_cidrs, count.index)

        tags = {
                Name = "private-subnet- ${count.index + 1}"
        }
}
