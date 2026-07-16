variable "cluster_name" {

  description = "EKS Cluster Name"

  type = string

}

variable "access_entries" {

  description = "EKS Access Entries"

  type = map(object({

    principal_arn = string

    kubernetes_groups = optional(list(string), [])

    policy_associations = optional(list(object({

      policy_arn = string

      access_scope = object({

        type       = string
        namespaces = optional(list(string), [])

      })

    })), [])

  }))

}