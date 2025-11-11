resource "aws_autoscaling_group" "ec2_asg" {
  max_size         = 20
  min_size         = 2
  desired_capacity = 2
  name             = "web-server-asg"

  target_group_arns   = [aws_lb_target_group.alb-tg.arn]
  vpc_zone_identifier = aws_subnet.private_subnet[*].id

  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  health_check_type = "EC2"

}

