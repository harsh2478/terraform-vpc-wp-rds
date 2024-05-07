resource "aws_db_subnet_group" "default" {
	name = "wordpress_db_subnet_group"
	subnet_ids = [ aws_subnet.private_subnets[0].id,  aws_subnet.private_subnets[1].id ]
	tags = {
		NAME = "wordpress_db_subnet_group"
	}
}

resource "aws_db_instance" "wordpress_db" {
	allocated_storage = var.rds_storage
	db_name = var.rds_db_name
	engine = "mysql"
	engine_version = "8.0.35"
	instance_class = var.rds_instance_class
	username = var.rds_db_username
	password = var.rds_db_password
	db_subnet_group_name = "wordpress_db_subnet_group"
	vpc_security_group_ids = [ aws_security_group.rds_sg.id ]
	parameter_group_name = "default.mysql8.0"
	skip_final_snapshot = true
}

