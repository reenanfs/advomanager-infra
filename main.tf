terraform {
  required_version = ">= 1.12.0"

  backend "s3" {
    bucket  = "terraform-advomanager-deployment-us-east-1"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

# Network setup: VPC, Subnets, IGW, SGs
module "network" {
  source        = "./modules/network"
  vpc_cidr      = var.vpc_cidr
  project_name  = var.project_name
  instance_type = var.ec2_instance_type
  region        = var.region
}

# ECR repository
module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.project_name
}

# IAM roles and policies
module "iam" {
  source                       = "./modules/iam"
  ecs_instance_role_name       = "${var.project_name}-ecs-instance-role"
  ecs_task_execution_role_name = "${var.project_name}-ecs-task-execution-role"
  region                       = var.region
  project_name                 = var.project_name
}

# Application Load Balancer
module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnet_ids
  alb_name       = "${var.project_name}-alb"
  project_name   = var.project_name
}

# ECS Cluster + Task + Service
module "ecs" {
  source                    = "./modules/ecs"
  project_name              = var.project_name
  cluster_name              = "${var.project_name}-cluster"
  task_family               = "${var.project_name}-task"
  container_name            = "${var.project_name}-app"
  container_image           = module.ecr.repository_url
  container_port            = 8080
  container_cpu             = 256
  container_memory          = 512
  task_cpu                  = 256
  task_memory               = 512
  log_group_name            = "/ecs/${var.project_name}"
  region                    = var.region
  service_name              = "${var.project_name}-service"
  desired_count             = 1
  target_group_arn          = module.alb.target_group_arn
  task_execution_role_arn   = module.iam.ecs_task_execution_role_arn
  subnet_ids                = [module.network.private_subnet_ids[0]]
  alb_security_group_id     = module.alb.security_group_id
  vpc_id                    = module.network.vpc_id
  autoscaling_group_arn     = module.ec2.autoscaling_group_arn
  ssm_application_name_arn  = module.ssm_parameters.application_name_param_arn
  ssm_postgres_jdbc_arn     = module.ssm_parameters.postgres_jdbc_param_arn
  ssm_postgres_user_arn     = module.ssm_parameters.postgres_user_param_arn
  ssm_postgres_password_arn = module.ssm_parameters.postgres_password_param_arn
}

# EC2 instances (ECS Cluster capacity providers)
module "ec2" {
  source                = "./modules/ec2"
  cluster_name          = "${var.project_name}-cluster"
  instance_type         = var.ec2_instance_type
  instance_profile_name = module.iam.ecs_instance_profile_name
  subnet_ids            = [module.network.private_subnet_ids[0]]
  security_group_ids    = [module.ecs.ecs_security_group_id]
  min_size              = 1
  max_size              = 1
  desired_capacity      = 1
}

module "ssm_parameters" {
  source = "./modules/ssm-parameters"

  application_name  = var.project_name
  postgres_jdbc     = module.rds.rds_jdbc_url
  postgres_user     = var.postgres_user
  postgres_password = var.postgres_password
}


# # RDS (Relational Database Service) for application persistence
module "rds" {
  source                = "./modules/rds"
  name                  = var.project_name
  vpc_id                = module.network.vpc_id
  private_subnet_ids    = module.network.private_subnet_ids
  ecs_security_group_id = module.ecs.ecs_security_group_id

  db_name  = var.project_name
  username = var.postgres_user
  password = var.postgres_password

  tags = {
    Project = var.project_name
  }
}
