module "Admin_VPC" {
  source               = "./modules/public-private-vpc"
  name                 = "Admin_VPC"
  vpc_cidr             = "10.3.0.0/16"
  private_subnets_cidr = ["10.3.1.0/24","10.3.2.0/24"]
  public_subnets_cidr  = ["10.3.3.0/24","10.3.4.0/24"]
  availability_zones   = slice(data.aws_availability_zones.available.names,0,2)
}