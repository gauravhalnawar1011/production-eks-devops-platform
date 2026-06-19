#################################################
# TLS CERTIFICATE
#################################################

data "tls_certificate" "eks" {

  url = var.oidc_issuer_url
}

#################################################
# OIDC PROVIDER
#################################################

resource "aws_iam_openid_connect_provider" "this" {

  client_id_list = [

    "sts.amazonaws.com"
  ]

  thumbprint_list = [

    data.tls_certificate.eks.certificates[0].sha1_fingerprint
  ]

  url = var.oidc_issuer_url

  tags = merge(

    var.common_tags,

    {
      Name = "${var.environment}-eks-oidc-provider"
    }
  )
}