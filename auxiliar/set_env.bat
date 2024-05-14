@echo off 

set /p username="Enter your username: "

$suscription_name = 'sandbox'
$suscription = az account list --query "[?name=='$suscription_name'].{tenantId:tenantId, id:id}" -o=json | ConvertFrom-Json

az account set --subscription $suscription.id

echo "Setting the display name to spnl3-$username" 
$sp_displayname = "spnl3-$username"
$sp_appId = az ad sp list --filter "displayName eq '$sp_displayname'" --query "[].{id: appId}" -o=tsv
echo "Setting the akv name to 'akv-$username-lab01'" 

$akv_name = 'akv-$username-lab01'
$akv_secret_name = 'spnl3-$username'
$sp_pwd= az keyvault secret show --vault-name $akv_name --name $akv_secret_name --query "value" -o=tsv

#Sets temporary environment variables
$env:ARM_CLIENT_ID = $sp_appId
$env:ARM_CLIENT_SECRET = $sp_pwd
$env:ARM_SUBSCRIPTION_ID = $suscription.id
$env:ARM_TENANT_ID = $suscription.tenantId

echo Press any key to close . . .
pause
