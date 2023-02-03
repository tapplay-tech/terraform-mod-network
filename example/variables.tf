variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}
variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}
variable "private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
  default     = []
}
variable "public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
  default     = []
}