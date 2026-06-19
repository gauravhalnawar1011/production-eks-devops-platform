#################################################
# ENVIRONMENT
#################################################

environment = "dev"

#################################################
# PROJECT
#################################################

project_name = "production-eks-platform"

#################################################
# EKS
#################################################

cluster_name = "dev-eks-cluster"

cluster_version = "1.35"

#################################################
# NODE GROUP
#################################################

instance_types = [

  "c7i-flex.large"
]

desired_size = 3

min_size = 3

max_size = 4

node_disk_size = 50

#################################################
# BOTTLEROCKET
#################################################

ami_type = "BOTTLEROCKET_x86_64"

#################################################
# LOGS
#################################################

cloudwatch_log_retention_days = 30


addons = [

  {
    name    = "vpc-cni"
    version = "v1.20.0-eksbuild.1"
  },

  {
    name    = "coredns"
    version = "v1.12.2-eksbuild.4"
  },

  {
    name    = "kube-proxy"
    version = "v1.33.0-eksbuild.2"
  },

  {
    name    = "eks-pod-identity-agent"
    version = "v1.3.8-eksbuild.2"
  }
]