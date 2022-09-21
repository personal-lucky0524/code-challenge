param (
    [Parameter(Mandatory=$false)][String]$ResourceGroupName,
    [Parameter(Mandatory=$false)][String]$VMResource,
    [Parameter(Mandatory=$false)][String]$ServicePrincipalName,
    [Parameter(Mandatory=$false)][String]$ServicePrincipalPass,
    [Parameter(Mandatory=$false)][String]$SubscriptionId,
    [Parameter(Mandatory=$false)][String]$TenantId,
	[Parameter(Mandatory=$false)][String]$tag
    [Parameter(Mandatory=$false)][Switch]$ConnectAzure,
    [Parameter(Mandatory=$false)][Switch]$ExportResource
)

#Connecting to Azure
if($ConnectAzure.IsPresent) {
    Write-Verbose -Message "Checking and Installing Azure Powershell Module"
    if (-not(Get-Module -Name Az.Accounts -ListAvailable)){
        Write-Warning "Module 'Az' is missing or out of date. Installing module now."
		$PSVersionTable.PSVersion
		Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force -AllowClobber
		Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force -AllowClobber
    }

    Write-Verbose -Message "Connecting to Azure"
    $ServicePrincipalPassword = ConvertTo-SecureString -AsPlainText -Force -String $ServicePrincipalPass
    $azureAppCred = New-Object System.Management.Automation.PSCredential ($ServicePrincipalName,$ServicePrincipalPassword)
    Connect-AzAccount -ServicePrincipal -Credential $azureAppCred -Tenant $TenantId -Subscription $SubscriptionId
}

# Convert resource output to json

if($ExportResource.IsPresent) {
    Write-Verbose "Set Azure Subscription"
	Set-AzContext -Tenant $TenantID -Subscription $Subscription
    Write-Verbose "Get resource details by using tag and convert it to json format"
	Get-AzResource -Tag $tag -ResourceType “Microsoft.Compute/virtualMachines”  | ConvertTo-Json
}