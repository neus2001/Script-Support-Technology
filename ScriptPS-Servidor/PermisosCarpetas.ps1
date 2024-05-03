# Ruta de la carpeta principal donde se crearán las carpetas de usuario
$carpetaPrincipal = "\\WINSERVER-AD\Users\Administrador\Documents\PerfilesMoviles"

# Obtener la lista de usuarios para los que se crearán las carpetas
$usuarios = Get-ADUser -Filter * -SearchBase "OU=Usuarios,DC=dominio,DC=com"

# Recorrer la lista de usuarios y crear las carpetas correspondientes
foreach ($usuario in $usuarios) {
    $carpetaUsuario = Join-Path -Path $carpetaPrincipal -ChildPath $usuario.SamAccountName

    # Crear la carpeta del usuario
    New-Item -ItemType Directory -Path $carpetaUsuario -Force

    # Asignar permisos de control total al usuario y quitar permisos para los demás
    $acl = Get-Acl -Path $carpetaUsuario
    $acl.SetAccessRuleProtection($true, $false)
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($usuario.SamAccountName, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($rule)
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Deny")
    $acl.AddAccessRule($rule)
    Set-Acl -Path $carpetaUsuario -AclObject $acl
}
