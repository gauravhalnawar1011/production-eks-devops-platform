output "cluster_name" {

  value = aws_eks_cluster.main.name
}

output "cluster_arn" {

  value = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {

  value = aws_eks_cluster.main.endpoint
}

output "cluster_oidc_issuer_url" {

  value = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "node_role_arn" {

  value = aws_iam_role.eks_node.arn
}

output "cluster_role_arn" {

  value = aws_iam_role.eks_cluster.arn
}

output "node_security_group_id" {

  description = "EKS Worker Node Security Group"

  value = aws_security_group.eks_node.id

}
