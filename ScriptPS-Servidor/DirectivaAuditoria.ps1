# Función para crear y configurar la política de auditoría
function ConfigurarPoliticaAuditoria {
    param (
        [string]$NombreGPO,
        [string]$PathOU
    )

    try {
        # Crear la GPO
        New-GPO -Name $NombreGPO -ErrorAction Stop
        
        # Vincular la GPO a la OU
        New-GPLink -Name $NombreGPO -Target $PathOU -LinkEnabled Yes -ErrorAction Stop

        # Configurar la auditoría en la GPO
        $AuditSettings = @{
            'AuditLogon' = 'Success,Failure'
            'AuditObjectAccess' = 'Success,Failure'
            'AuditPolicyChange' = 'Success,Failure'
        }

        foreach ($key in $AuditSettings.Keys) {
            Set-GPRegistryValue -Name $NombreGPO -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -ValueName $key -Type String -Value $AuditSettings[$key] -ErrorAction Stop
        }

        Write-Host "La GPO '$NombreGPO' se ha creado correctamente y se ha configurado la auditoría."
    } 
    catch {
        Write-Host "Error al crear la GPO: $_"
    }
}

# Llamar a la función para crear y configurar la política de auditoría
$NombreGPO = "PoliticaAuditoria"
$PathOU = "OU=ou.AdminSistemas,OU=ou.SST,DC=dom,DC=SST"

ConfigurarPoliticaAuditoria -NombreGPO $NombreGPO -PathOU $PathOU
