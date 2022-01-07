#### EC2 Security group  && EC2 Proxy ####

 resource "aws_key_pair" "ssh_key" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+EWTinZHyIlJi+LlDQLAHXIPfR3iL8ffxZ5ip+GMdBc+yWzEvnvo4LHYGsAQo2TufZVdrYDeBcZC5T4pooN0h/RIh8x6IICGoO1GScy/MUT7uUqMy0bTERVDwnyW+mSEFqRQGuPD7dynwEH2fV4K2HJO7FyUcQqP6YIRkcTnisFp5SxcuExAO4JnEGUTYY0VikGPJHipZvjg31pfeaon8HQn/t2igIzudMjXL4nlEcaDnAuyWYk3gN4FXdEBOuyO/t/Gd99I2e16nhFdXz6GieZkeGFYchSIQ5U82Oks0N1yjdKNAF6IfuhMWTJZhhyIjNnIr1/NltdE/3+Nf7LjDx9qf94/a+3gBF+iKSotTTrKNaIPwH69ZUUlToXcYh6Ptg69FV0+PM3OLm9Xztd4XkVKwMBKUFxioozDAZ3kAPgsoNa4ngQl861wgs+rpL1zz3zbfBhUTiavk2jP98cNSCjll+H0HX66ciBrMN/1DqRyxy7JAjLQT1OfXLep5NhE= motawfik@Mohameds-MacBook-Pro-3.local"
} 

resource "aws_launch_configuration" "web_conf" {
  name_prefix   = "web-app-ec2"
  image_id      = var.ec2_ami
  instance_type = var.instance_type
  key_name = aws_key_pair.ssh_key.id
  security_groups = [aws_security_group.web_app_ec2_all_in_out.id]

  root_block_device {
    volume_size = "8"
  }

  user_data = filebase64("${path.module}/web-app-setup.sh")

    lifecycle {
        create_before_destroy = true
    }
  
}

resource "aws_autoscaling_group" "asg_conf" {
  name                 = "web-app-asg"
  launch_configuration = aws_launch_configuration.web_conf.name
  vpc_zone_identifier  = var.ec2_private_subnet_ids
  target_group_arns    = [aws_lb_target_group.lb_tg.arn]
  min_size             = var.min_size
  max_size             = var.max_size
}

resource "aws_autoscaling_policy" "asp_conf" {
  name                   = "web_app_asp"
  policy_type            = "TargetTrackingScaling"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.asg_conf.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}