# main.tf
provider "aws" {
  //  version = "~> 2.70"
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "network" {
  source = "./modules/network"

  availability_zone = var.availability_zone
}

module "security-groups" {
  source = "./modules/security"

  vpc_id = module.network.network_vpc_id
}

module "efs" {
  source = "./modules/efs"

  efs_subnet_id = module.network.efs_subnet_id
  security_group_id = module.security-groups.security_group_id
  //  subnet_id = aws_subnet.subnet-efs.id
}