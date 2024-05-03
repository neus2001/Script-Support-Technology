# Función para crear una OU
function CrearOU {
    $NombreOU = Read-Host "Introduce el nombre de la OU"
    $PathPadre = Read-Host "Introduce el path de la OU padre (o 'Dominio' si es en el nivel de dominio)"
    
    try {
        New-ADOrganizationalUnit -Name $NombreOU -Path $PathPadre -ErrorAction Stop
        Write-Host "La OU $NombreOU ha sido creada en $PathPadre"
    } catch {
        Write-Host "Error al crear la OU: $_"
    }
}

# Función para crear un grupo
function CrearGrupo {
    $NombreGrupo = Read-Host "Introduce el nombre del grupo"
    $PathOU = Read-Host "Introduce el path de la OU donde deseas crear el grupo"
    
    try {
        New-ADGroup -Name $NombreGrupo -GroupCategory Security -GroupScope Global -Path $PathOU -ErrorAction Stop
        Write-Host "El grupo $NombreGrupo ha sido creado en $PathOU"
    } catch {
        Write-Host "Error al crear el grupo: $_"
    }
}

# Función para crear un usuario
function CrearUsuario {
    $Nombre = Read-Host "Introduce el nombre del usuario"
    $SamAccountName = Read-Host "Introduce el SamAccountName del usuario"
    $OU = Read-Host "Introduce la OU donde deseas crear el usuario"
    
    try {
        New-ADUser -Name $Nombre -SamAccountName $SamAccountName -Path $OU -ErrorAction Stop
        Write-Host "El usuario $Nombre ha sido creado en $OU"
    } catch {
        Write-Host "Error al crear el usuario: $_"
    }
}

# Función para agregar un usuario a un grupo
function AgregarUsuarioAGrupo {
    $Usuario = Read-Host "Introduce el SamAccountName del usuario"
    $Grupo = Read-Host "Introduce el nombre del grupo"

    try {
        Add-ADGroupMember -Identity $Grupo -Members $Usuario -ErrorAction Stop
        Write-Host "El usuario $Usuario ha sido agregado al grupo $Grupo"
    } catch {
        Write-Host "Error al agregar el usuario al grupo: $_"
    }
}

# Función para salir del script
function Salir {
    Write-Host "Saliendo del script..."
    exit
}

# Menú principal
do {
    Write-Host "Bienvenido al asistente de creación de objetos en Active Directory"
    Write-Host "Selecciona una opción:"
    Write-Host "1. Crear OU"
    Write-Host "2. Crear Grupo"
    Write-Host "3. Crear Usuario"
    Write-Host "4. Agregar Usuario a Grupo"
    Write-Host "5. Salir del script"

    $opcion = Read-Host "Introduce el número de la opción deseada"

    switch ($opcion) {
        '1' { CrearOU }
        '2' { CrearGrupo }
        '3' { CrearUsuario }
        '4' { AgregarUsuarioAGrupo }
        '5' { Salir }
        default { Write-Host "Opción no válida" }
    }
} while ($true)
