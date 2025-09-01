terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "eu-west-3"
}

module "networking" {
  source = "./modules/networking"
  project_name = var.project_name
}

module "ec2" {
  source = "./modules/ec2"
  project_name   = var.project_name
  subnet_id      = module.networking.public_subnet_id
  vpc_security_group_ids = [module.networking.web_sg_id]
  # Passage des infos DB au script d’installation
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  db_host     = module.rds.endpoint
}

module "rds" {
  source = "./modules/rds"
  project_name   = var.project_name
  db_username    = var.db_username
  db_password    = var.db_password
  db_name        = var.db_name
  db_subnet_ids  = module.networking.private_subnet_ids
  vpc_security_group_ids = [module.networking.rds_sg_id]
}

module "ebs" {
  source = "./modules/ebs"
  project_name = var.project_name
  instance_id = module.ec2.instance_id
  az          = module.ec2.availability_zone
}
