### Ejercicio 1

```console 
az login
```
![ Captura login ](./capturas/login.png)




#### Comandos para preparar variables de entorno por comodidad

```console 
$suscription_name = 'sandbox'
```

Gets the suscription's data
```console 
$suscription_name = 'sandbox'
$suscription = az account list --query "[?name=='$suscription_name'].{tenantId:tenantId, id:id}" -o=json | ConvertFrom-Json
```

Sets suscription to use
```console 
az account set --subscription $suscription.id
```

Finds existing service principal
```console 
$sp_displayname = 'spnl3-lrodriguez'
$sp_appId = az ad sp list --filter "displayName eq '$sp_displayname'" --query "[].{id: appId}" -o=tsv
$akv_name = 'akv-lrodriguez-lab01'
$akv_secret_name = 'spnl3-lrodriguez'
$sp_pwd= az keyvault secret show --vault-name $akv_name --name $akv_secret_name --query "value" -o=tsv
```

#Sets temporary environment variables
```console 

$env:ARM_CLIENT_ID = $sp_appId
$env:ARM_CLIENT_SECRET = $sp_pwd
$env:ARM_SUBSCRIPTION_ID = $suscription.id
$env:ARM_TENANT_ID = $suscription.tenantId
```