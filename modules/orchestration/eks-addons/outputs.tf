#################################################
# ADDON ARNS
#################################################

output "addon_arns" {

  value = {

    for k, v in aws_eks_addon.addons :

    k => v.arn
  }
}

#################################################
# ADDON NAMES
#################################################

output "addon_names" {

  value = [

    for addon in aws_eks_addon.addons :

    addon.addon_name
  ]
}

#################################################
# ADDON VERSIONS
#################################################

output "addon_versions" {

  value = {

    for k, v in aws_eks_addon.addons :

    k => v.addon_version
  }
}