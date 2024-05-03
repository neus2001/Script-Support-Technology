# Ruta base donde se almacenarán los perfiles móviles
$ProfilePath = "\\WINSERVER-AD\Users\Administrador\Documents\PerfilesMoviles"

# Lista completa de nombres de usuarios
$usuarios = "nchafer", "jlopez", "mgarcia", "lmarquez", "egimenez", "jmateu", "mquesada", "ojuarez", "jgomez", "nmolina", "pcháfer", "sclimente", "jvidal", "gramir", "rnadal", "evbataller", "vramos", "mcarpi", "rferrer", "pbilal", "drequena", "psanchez", "sgimenez", "ellutx", "cbalaguer", "vbalaller", "rmurillo", "eiglesias"

# Definir la lista de permisos que deseas asignar (Control total para el usuario y el administrador del sistema)
$permisos = "FullControl", "FullControl"

# Función para establecer los permisos en una carpeta y sus subcarpetas recursivamente
function Set-FolderPermissions {
    param (
        [string]$FolderPath,
        [string[]]$Users,
        [string[]]$Permissions
    )

    try {
        # Obtener el objeto de la carpeta
        $FolderACL = Get-Acl -Path $FolderPath

        # Crear una regla de acceso para cada usuario
        for ($i = 0; $i -lt $Users.Count; $i++) {
            $User = $Users[$i]
            $Permission = $Permissions[$i]
            
            # Asignar los derechos de archivo correspondientes al nivel de permisos
            switch ($Permission) {
                "FullControl" {
                    $FileSystemRights = [System.Security.AccessControl.FileSystemRights]::FullControl
                }
                # Agregar más casos según sea necesario para otros niveles de permisos
            }

            # Crear el objeto FileSystemAccessRule con los argumentos correctos
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $User,
                $FileSystemRights,
                "ContainerInherit,ObjectInherit",
                "None",
                "Allow"
            )
            $FolderACL.AddAccessRule($AccessRule)
        }

        # Establecer los permisos en la carpeta
        Set-Acl -Path $FolderPath -AclObject $FolderACL

        # Recorrer todas las subcarpetas y establecer los mismos permisos
        Get-ChildItem -Path $FolderPath -Directory | ForEach-Object {
            Set-FolderPermissions -FolderPath $_.FullName -Users $Users -Permissions $Permissions
        }

        Write-Host "Se han establecido los permisos en la carpeta $FolderPath y sus subcarpetas."
    } catch {
        Write-Host ("Error al establecer permisos en la carpeta ${FolderPath}:`n$_")
    }
}

# Llamar a la función para establecer permisos en la carpeta base y sus subcarpetas
Set-FolderPermissions -FolderPath $ProfilePath -Users $usuarios -Permissions $permisos
