region           = "us-east-1"
eks_cluster_name = "eks-cluster-example-test"
vpc_name         = "eks-vpc-test"
cidr             = "192.168.0.0/16"
private_subnets  = ["192.168.160.0/19", "192.168.128.0/19", "192.168.96.0/19"]
public_subnets   = ["192.168.64.0/19", "192.168.32.0/19", "192.168.0.0/19"]