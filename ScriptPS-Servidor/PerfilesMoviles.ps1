# Definir la ruta base donde se almacenarán los perfiles móviles
$ProfilePath = "\\WINSERVER-AD\Users\Administrador\Documents\PerfilesMoviles"

# Lista de nombres de usuarios
$usuarios = "nchafer", "jlopez", "mgarcia", "lmarquez", "egimenez", "jmateu", "mquesada", "ojuarez", "jgomez", "nmolina", "pcháfer", "sclimente", "jvidal", "gramir", "rnadal", "evbataller", "vramos", "mcarpi", "rferrer", "pbilal", "drequena", "psanchez", "sgimenez", "ellutx", "cbalaguer", "vbalaller", "rmurillo", "eiglesias"
foreach ($usuario in $usuarios) {
    # Obtener el usuario por su SamAccountName
    $User = Get-ADUser -Filter { SamAccountName -eq $usuario }

    if ($User -ne $null) {
        $UserProfilePath = "$ProfilePath\$usuario"
        
        # Configurar el perfil móvil para el usuario
        Set-ADUser $User -ProfilePath $UserProfilePath
        Write-Host "Se ha creado el perfil móvil para $($User.SamAccountName) en la ruta $UserProfilePath"
    } else {
        Write-Host "El usuario con el nombre de cuenta $usuario no se encontró en el directorio activo."
    }
}

Write-Host "Se han creado perfiles móviles para los usuarios especificados."
