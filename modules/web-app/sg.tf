resource "aws_security_group" "web_app_ec2_all_in_out" {
  name        = "allow_all_in_out"
  description = "Allow all inbound, outbound traffic to web application server"
  vpc_id      = var.vpc_id
  
  ingress {
    description = "allow port 80"
    from_port   = var.web_app_port
    to_port     = var.web_app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}