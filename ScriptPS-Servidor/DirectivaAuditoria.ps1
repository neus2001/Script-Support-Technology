# Funci�n para crear y configurar la pol�tica de auditor�a
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

        # Configurar la auditor�a en la GPO
        $AuditSettings = @{
            'AuditLogon' = 'Success,Failure'
            'AuditObjectAccess' = 'Success,Failure'
            'AuditPolicyChange' = 'Success,Failure'
        }

        foreach ($key in $AuditSettings.Keys) {
            Set-GPRegistryValue -Name $NombreGPO -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -ValueName $key -Type String -Value $AuditSettings[$key] -ErrorAction Stop
        }

        Write-Host "La GPO '$NombreGPO' se ha creado correctamente y se ha configurado la auditor�a."
    } 
    catch {
        Write-Host "Error al crear la GPO: $_"
    }
}

# Llamar a la funci�n para crear y configurar la pol�tica de auditor�a
$NombreGPO = "PoliticaAuditoria"
$PathOU = "OU=ou.AdminSistemas,OU=ou.SST,DC=dom,DC=SST"

ConfigurarPoliticaAuditoria -NombreGPO $NombreGPO -PathOU $PathOU
