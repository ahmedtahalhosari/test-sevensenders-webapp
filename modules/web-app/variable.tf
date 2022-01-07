variable "web_app_port" {
    description = "The port used to access web application on EC2"
    default = 80
}

variable "ec2_ami" {
    //amzn2-ami-hvm-2.0.20210427.0-x86_64-gp2
    description = "AMI used to create the EC2"
    default = "ami-0d5eff06f840b45e9"
}

variable "ec2_private_subnet_ids" {
  description = "the subnet allocated to the ec2 where it will be created"
}

variable "instance_type" {
  description = "Type of the create instance"
  default =  "t2.micro"
}

variable "vpc_id" {
  description = "VPC id assigned to the security group and ALB"
}

variable "min_size" {
  description = "Min size for the autoscaling of the Ec2 instances"
  default = 2
}

variable "max_size" {
  description = "Max size for the autoscaling of the ec2 instances"
  default = 5
}

variable "public_subnet_id" {
  description = "public subnet id where the alb will be created"
}
