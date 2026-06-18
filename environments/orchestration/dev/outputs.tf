output "cluster_name" {

  value = module.eks_cluster.cluster_name
}

output "cluster_arn" {

  value = module.eks_cluster.cluster_arn
}

output "cluster_endpoint" {

  value = module.eks_cluster.cluster_endpoint
}

output "cluster_oidc_issuer_url" {

  value = module.eks_cluster.cluster_oidc_issuer_url
}

output "node_role_arn" {

  value = module.eks_cluster.node_role_arn
}

output "cluster_role_arn" {

  value = module.eks_cluster.cluster_role_arn
}