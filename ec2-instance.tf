resource "aws_instance" "ec2-1" {
        ami           = data.aws_ami.amazon-linux.id
        instance_type = var.instance-type
        key_name = var.key_name
        subnet_id = aws_subnet.public_subnets[0].id
        vpc_security_group_ids = [aws_security_group.sg.id]
        associate_public_ip_address = true


        tags = {
                Name = "WORDPRESS"
        }
}
