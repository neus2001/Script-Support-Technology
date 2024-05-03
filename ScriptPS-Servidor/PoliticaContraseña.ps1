try {
    # Crear la GPO
    New-GPO -Name "PoliticaContraseña" -ErrorAction Stop

    # Configurar la política de contraseña compleja
    Set-GPRegistryValue -Name "PoliticaContraseña" -Key "HKLM\Software\Policies\Microsoft Services\AdmPwd" -ValueName "PasswordComplexity" -Type DWord -Value 1 -ErrorAction Stop

    # Asignar la GPO a todas las OUs
    Get-ADOrganizationalUnit -Filter * | ForEach-Object {
        New-GPLink -Name "PoliticaContraseña" -Target $_ -ErrorAction Stop
    }

    Write-Host "La GPO 'PoliticaContraseña' se ha establecido correctamente."
} catch {
    Write-Host "Error al establecer la GPO: $_"
}
