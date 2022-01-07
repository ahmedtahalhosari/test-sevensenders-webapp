output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = " vpc-id for public VPC "
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private_subnet.*.id

}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public_subnet.*.id

}

output "public_tables" {
  description = "route table for public"
  value       = aws_route_table.public.id
}

output "default_security_group_id" {
  description = "default sec group for the vpc"
  value       = aws_vpc.vpc.default_security_group_id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}



output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.private.*.id
}

output "public_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.public.*.id
}

