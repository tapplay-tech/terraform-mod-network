
variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "eks-vpc"
}
variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}
variable "private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
  default     = ["192.168.160.0/19", "192.168.128.0/19", "192.168.96.0/19"]
}
variable "public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
  default     = ["192.168.64.0/19", "192.168.32.0/19", "192.168.0.0/19"]
}