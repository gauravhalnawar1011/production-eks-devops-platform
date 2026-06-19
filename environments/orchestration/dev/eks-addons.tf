module "eks_addons" {

  source = "../../../modules/orchestration/eks-addons"

  environment = var.environment

  cluster_name = module.eks_cluster.cluster_name

  common_tags = local.common_tags

  addons = var.addons

  depends_on = [
    module.eks_cluster
  ]
}