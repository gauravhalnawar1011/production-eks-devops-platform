output "access_entries" {

  value = aws_eks_access_entry.this

}

output "policy_associations" {

  value = aws_eks_access_policy_association.this

}