output "service_account_name" {

  description = "Service Account Name"

  value = kubernetes_service_account_v1.this.metadata[0].name

}

output "namespace" {

  description = "Namespace"

  value = kubernetes_service_account_v1.this.metadata[0].namespace

}

output "service_account_id" {

  description = "Service Account ID"

  value = kubernetes_service_account_v1.this.id

}