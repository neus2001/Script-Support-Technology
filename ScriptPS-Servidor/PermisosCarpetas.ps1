# Definir la ruta base para los perfiles móviles
$BasePath = "\\WINSERVER-AD\Users\Administrador\Documents\PerfilesMoviles"

# Lista de usuarios que tendrán control total en la carpeta principal
$UsuariosConPermisosTotales = "nchafer", "jlopez", "mgarcia", "lmarquez", "egimenez", "jmateu", "mquesada", "ojuarez", "jgomez", "nmolina", "pcháfer", "sclimente", "jvidal", "gramir", "rnadal", "evbataller", "vramos", "mcarpi", "rferrer", "pbilal", "drequena", "psanchez", "sgimenez", "ellutx", "cbalaguer", "vbalaller", "rmurillo", "eiglesias"

# Agregar permisos a la carpeta principal compartida
$Acl = Get-Acl -Path $BasePath
$Permission = "Everyone", "FullControl", "Allow"
$Rule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $Permission
$Acl.SetAccessRule($Rule)
Set-Acl -Path $BasePath -AclObject $Acl

# Iterar sobre la lista de usuarios y asignar permisos
foreach ($Usuario in $UsuariosConPermisosTotales) {
    $ProfilePath = Join-Path -Path $BasePath -ChildPath $Usuario

    # Verificar si la carpeta del usuario existe
    if (Test-Path -Path $ProfilePath -PathType Container) {
        # Agregar permisos totales al usuario
        $AclUser = Get-Acl -Path $ProfilePath
        $PermissionUser = "Dom\$Usuario", "FullControl", "Allow"
        $RuleUser = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $PermissionUser
        $AclUser.SetAccessRule($RuleUser)

        # Deshabilitar la herencia de permisos
        $AclUser.SetAccessRuleProtection($true, $false)

        Set-Acl -Path $ProfilePath -AclObject $AclUser
        Write-Host "Se han configurado los permisos para la carpeta del usuario $Usuario."
    } else {
        Write-Host "La carpeta del usuario $Usuario no existe en '$ProfilePath'."
    }
}

Write-Host "Se han configurado los permisos para las carpetas personales de los usuarios del dominio en la carpeta principal compartida."
