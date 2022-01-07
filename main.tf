module "test-web-app" {
    source = "./modules/web-app"
    ec2_private_subnet_ids = module.Admin_VPC.private_subnets
    public_subnet_id = module.Admin_VPC.public_subnets
    vpc_id = module.Admin_VPC.vpc_id
    
}