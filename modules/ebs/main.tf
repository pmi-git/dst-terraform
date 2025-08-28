resource "aws_ebs_volume" "wordpress_data" {
  availability_zone = var.az
  size              = 10
  tags = {
    Name = "${var.project_name}-ebs"
  }
}

resource "aws_volume_attachment" "wordpress_data_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.wordpress_data.id
  instance_id = var.instance_id
  force_detach = true
}
