
provider "aws" {
  region = var.region
}

module "vpc" {
  source        = "./modules/vpc"
  vpc_cidr      = var.vpc_cidr
  subnet_cidrs  = var.subnet_cidrs
  azs           = var.azs
  naming_prefix = var.naming_prefix
  project_name  = var.project_name
  bootcamp_tags = var.bootcamp_tags
}

module "security_group" {
  source        = "./modules/security_group"
  vpc_id        = module.vpc.vpc_id
  naming_prefix = var.naming_prefix
  project_name  = var.project_name
  bootcamp_tags = var.bootcamp_tags
}

module "iam" {
  source        = "./modules/iam"
  naming_prefix = var.naming_prefix
  project_name  = var.project_name
  bootcamp_tags = var.bootcamp_tags
}

module "eks" {
  source           = "./modules/eks"
  cluster_version  = var.cluster_version
  subnet_ids       = module.vpc.subnet_ids
  vpc_id           = module.vpc.vpc_id
  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
  instance_type    = var.instance_type
  key_name         = var.key_name
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
  naming_prefix    = var.naming_prefix
  project_name     = var.project_name
  bootcamp_tags    = var.bootcamp_tags
}

module "argocd" {
  source           = "./modules/argocd"
  depends_on       = [module.eks]
  argocd_name      = var.argocd_name
  argocd_chart     = var.argocd_chart
  argocd_repo      = var.argocd_repo
  argocd_version   = var.argocd_version
  argocd_namespace = var.argocd_namespace
}
