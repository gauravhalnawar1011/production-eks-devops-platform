locals {

  common_tags = {

    Environment = var.environment

    Project = var.project_name

    ManagedBy = "Terraform"

  }

}

module "eks_access" {

  source = "../../../../modules/orchestration/eks-access"

  cluster_name = data.terraform_remote_state.orchestration.outputs.cluster_name

  access_entries = {

    admin-host = {

      principal_arn = data.terraform_remote_state.admin_host.outputs.iam_role_arn

      policy_associations = [

        {

          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {

            type = "cluster"

          }

        }

      ]

    }

  }

}