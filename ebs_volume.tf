resource "aws_ebs_volume" "EBS" {
        size = var.volume-size
        availability_zone = aws_instance.ec2-1.availability_zone
        tags = {
                Name = "Terraform-project-ebs"
        }
}

resource "aws_volume_attachment" "ebs_attach" {
        device_name = "/dev/xvdb"
        volume_id = aws_ebs_volume.EBS.id
        instance_id = aws_instance.ec2-1.id
}
