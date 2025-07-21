data "aws_ami" "ecs" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_launch_template" "ecs" {
  name_prefix   = "${var.cluster_name}-lt"
  image_id      = data.aws_ami.ecs.id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    cluster_name = var.cluster_name
  }))

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.cluster_name}-ecs-instance"
    }
  }
}

resource "aws_autoscaling_group" "ecs" {
  name                  = "${var.cluster_name}-asg"
  max_size              = var.max_size
  min_size              = var.min_size
  desired_capacity      = var.desired_capacity
  health_check_type     = "EC2"
  force_delete          = true
  protect_from_scale_in = true
  vpc_zone_identifier   = var.subnet_ids

  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-ecs-instance"
    propagate_at_launch = true
  }
}
