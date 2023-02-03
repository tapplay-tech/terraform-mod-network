output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = module.vpc.vpc_name
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "private_subnets" {
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  value       = module.vpc.public_subnets
}