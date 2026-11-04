
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("apply", "destroy")]
    [string]$Action
)

$ErrorActionPreference = "Stop"

#################################################
# APPLY
#################################################

function Apply {

    Write-Host "=================================="
    Write-Host "Terraform Init"
    Write-Host "=================================="

    terraform init

    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    Write-Host "=================================="
    Write-Host "Terraform Validate"
    Write-Host "=================================="

    terraform validate

    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    Write-Host "=================================="
    Write-Host "Terraform Plan"
    Write-Host "=================================="

    terraform plan `
        -var-file="terraform.tfvars"

    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

    Write-Host "=================================="
    Write-Host "Terraform Apply"
    Write-Host "=================================="

    terraform apply `
        -var-file="terraform.tfvars" `
        --auto-approve

    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

#################################################
# DESTROY
#################################################

function Destroy {

    Write-Host "=================================="
    Write-Host "Terraform Destroy"
    Write-Host "=================================="

    terraform destroy `
        -var-file="terraform.tfvars" `
        --auto-approve

    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

#################################################
# MAIN
#################################################

switch ($Action) {

    "apply" {
        Apply
    }

    "destroy" {
        Destroy
    }

    default {
        Write-Host ""
        Write-Host "Usage:"
        Write-Host ".\deploy.ps1 apply"
        Write-Host ".\deploy.ps1 destroy"
        Write-Host ""
        exit 1
    }
}
