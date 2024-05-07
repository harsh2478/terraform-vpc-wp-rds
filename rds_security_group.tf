resource "aws_security_group" "rds_sg" {
        name = "rds_sg"
        description = "This security group is for RDS instance"
        vpc_id = aws_vpc.vpc.id

        tags = {
                Name = "rds_sg"
        }
}

resource "aws_vpc_security_group_ingress_rule" "rds_sg_ingress" {
        security_group_id = aws_security_group.rds_sg.id
        cidr_ipv4 = "${aws_instance.ec2-1.private_ip}/32"
        from_port = 3306
        ip_protocol = "tcp"
        to_port = 3306
}

resource "aws_vpc_security_group_egress_rule" "rds_sg_egress" {
        security_group_id = aws_security_group.rds_sg.id
        cidr_ipv4         = "0.0.0.0/0"
        ip_protocol       = "-1" # semantically equivalent to all ports
}
