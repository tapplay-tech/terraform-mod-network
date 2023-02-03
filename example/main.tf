module "vpc" {
  source           = "../network/vpc/"
  region           = var.region
  eks_cluster_name = var.eks_cluster_name
  vpc_name         = var.vpc_name
  cidr             = var.cidr
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
}
