$suscription_name = 'sandbox'
$suscription = az account list --query "[?name=='$suscription_name'].{tenantId:tenantId, id:id}" -o=json | ConvertFrom-Json

az account set --subscription $suscription.id

$sp_displayname = 'spnl3-lrodriguez'
$sp_appId = az ad sp list --filter "displayName eq '$sp_displayname'" --query "[].{id: appId}" -o=tsv
$akv_name = 'akv-lrodriguez-lab01'
$akv_secret_name = 'spnl3-lrodriguez'
$sp_pwd= az keyvault secret show --vault-name $akv_name --name $akv_secret_name --query "value" -o=tsv

#Sets temporary environment variables
$env:ARM_CLIENT_ID = $sp_appId
$env:ARM_CLIENT_SECRET = $sp_pwd
$env:ARM_SUBSCRIPTION_ID = $suscription.id
$env:ARM_TENANT_ID = $suscription.tenantId