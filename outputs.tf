output "vpc" {
  description = "The created VPC"
  value       = module.vpc.vpc
}

output "private_subnets" {
  description = "List of IDs of the created VPC Private Subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of the created VPC Public Subnets"
  value       = module.vpc.public_subnets
}

output "private_route_table" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table
}

output "public_route_table" {
  description = "List of IDs of public route tables"
  value       = module.vpc.public_route_table
}

output "nat_gateway" {
  description = "Map containing IP addresses and ID of the NAT Gateway created for the VPC"
  value       = module.vpc.nat_gateway
}

output "vpc_default_security_group" {
  description = "Default security group for the VPC"
  value       = module.vpc.vpc_default_security_group
}

output "instance_role" {
  description = "IAM Instance Role for EC2 instance"
  value       = module.iam.instance_role
}

output "instance_profile" {
  description = "IAM Instance Profile for EC2 instance"
  value       = module.iam.instance_profile
}

output "rds_sg" {
  description = "Security group for RDS instance"
  value       = module.security_groups.rds_sg
}
output "instance_sg" {
  description = "Security group for EC2 instances"
  value       = module.security_groups.instance_sg
}

output "rds_cluster" {
  description = "RDS Cluster details"
  value       = module.rds.mysql_cluster
}
