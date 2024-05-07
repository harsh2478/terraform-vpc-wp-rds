resource "null_resource" "nullremote1" {
	
	provisioner "remote-exec" {
		inline = [
			"sudo yum update -y",
			"sudo mkfs.ext4 /dev/xvdb",
			"sudo yum install git httpd -y",
			"sudo mount /dev/xvdb /var/www/html",
			"sudo amazon-linux-extras install -y mariadb10.5 php8.2",
			"sudo git clone https://github.com/WordPress/WordPress.git",
			"sudo mv WordPress/* /var/www/html/",
			"sudo chown -R /var/ww/html/",
			"sudo systemctl start httpd"
		]
	
	}

	connection {
		type = "ssh"
		user = "ec2-user"
		private_key = file(var.key_path)
		host = aws_instance.ec2-1.public_ip 
	}

}
