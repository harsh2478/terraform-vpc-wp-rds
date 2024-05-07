variable "aws-region" {
	type = string
	default = "us-west-1"
}

variable "vpc-cidr" {
	type = string
	default = "192.168.0.0/16"
}

variable "aws_azs" {
        type = list(string)
        default = ["us-west-1a", "us-west-1b"]
}

variable "public_subnet_cidrs" {
        type        = list(string)
        description = "Public Subnet CIDR values"
        default     = ["192.168.1.0/24", "192.168.2.0/24"]
}

variable "private_subnet_cidrs" {
        type = list(string)
        description = "Private subnet CIDR values"
        default = ["192.168.3.0/24", "192.168.4.0/24"]
}

variable "instance-type" {
	type = string
	default = "t2.micro"
}

variable "key_name" {
	type = string
	default = "IAM_California"
}

variable "key_path" {
	type = string
	default = "C:/Users/Harsh Gupta/Documents/AWS_keys/IAM_California.pem"
}

variable "volume-size" {
	type = number
	default = 10
}

variable "rds_db_name" {
	type = string
	default = "wordpress_db"
}

variable "rds_db_username" {
	type = string
	default = "admin"
}

variable "rds_db_password" {
	type = string
	default = "Redhat123"
}

variable "rds_storage" {
	type = number
	default = 10
}

variable "rds_instance_class" {
	type = string
	default = "db.t3.micro"
}

