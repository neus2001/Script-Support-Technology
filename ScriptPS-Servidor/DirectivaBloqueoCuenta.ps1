try {
    Write-Output "Aplicando la configuración de la directiva Default Domain Controllers Policy a la OU principal ou.SST del dominio Dom.SST..."

    # Obtener la OU principal ou.SST del dominio Dom.SST
    $ouPrincipal = Get-ADOrganizationalUnit -Filter "Name -eq 'ou.SST'" -SearchBase "DC=Dom,DC=SST"

    # Verificar si se encontró la OU principal
    if ($ouPrincipal -eq $null) {
        Write-Output "Error: No se pudo encontrar la OU principal ou.SST del dominio Dom.SST."
        return
    }

    # Obtener la directiva Default Domain Controllers Policy
    $dcPolicy = Get-GPO -Name "Default Domain Controllers Policy"

    # Verificar si se encontró la directiva
    if ($dcPolicy -eq $null) {
        Write-Output "Error: No se pudo encontrar la directiva Default Domain Controllers Policy."
        return
    }

    # Aplicar la directiva a la OU principal ou.SST
    New-GPLink -Name $dcPolicy.DisplayName -Target $ouPrincipal.DistinguishedName

    # Habilitar la herencia de GPOs en la OU principal ou.SST
    Set-ADOrganizationalUnit -Identity $ouPrincipal.DistinguishedName -ProtectedFromAccidentalDeletion $false

    Write-Output "Configuración de la directiva aplicada correctamente a la OU principal ou.SST del dominio Dom.SST y la herencia de GPOs habilitada."
} catch {
    Write-Output "Se produjo un error al aplicar la configuración de la directiva: $_"
}
