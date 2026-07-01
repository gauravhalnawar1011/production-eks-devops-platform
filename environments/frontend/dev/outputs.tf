output "bucket_name" {

  value = module.frontend_bucket.bucket_name

}

output "cloudfront_domain" {

  value = module.cloudfront.distribution_domain_name

}

output "frontend_url" {

  value = "https://${var.frontend_domain}"

}