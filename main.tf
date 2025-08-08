module "iam" {
  source = "./iam"

  name   = var.name
  region = local.region

  providers = {
    aws = aws
  }
}

module "vpc" {
  source = "./vpc"

  name                    = var.name
  vpc_cidr                = var.vpc_cidr
  availability_zones      = var.availability_zones
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  enable_dns_hostnames    = var.enable_dns_hostnames
  instance_tenancy        = var.instance_tenancy
  map_public_ip_addresses = var.map_public_ip_addresses

  providers = {
    aws = aws
  }
}

module "ec2" {
  source = "./ec2"

  name                = var.name
  instance_type       = var.instance_type
  cpu_architecture    = var.cpu_architecture
  instance_profile    = module.iam.instance_profile["name"]
  publicly_accessible = var.publicly_accessible
  public_subnets      = module.vpc.public_subnets
  private_subnets     = module.vpc.private_subnets
  instance_sg         = module.security_groups.instance_sg

  providers = {
    aws = aws
  }
}

module "security_groups" {
  source = "./security_groups"

  name = var.name
  vpc  = module.vpc.vpc["id"]

  providers = {
    aws = aws
  }
}


module "rds" {
  source = "./rds"

  name                                = var.name
  security_group_ids                  = [module.security_groups.rds_sg]
  private_subnets                     = module.vpc.private_subnets
  rds_instance_class                  = var.rds_instance_class
  cluster_engine                      = var.cluster_engine
  cluster_engine_version              = var.cluster_engine_version
  storage_encrypted                   = var.storage_encrypted
  deletion_protection                 = var.deletion_protection
  skip_final_snapshot                 = var.skip_final_snapshot
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  ca_cert_identifier                  = var.ca_cert_identifier
  apply_immediately                   = var.apply_immediately

  providers = {
    aws = aws
  }
}
