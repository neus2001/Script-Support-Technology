# Definir la ruta base para los perfiles m�viles
$BasePath = "\\WINSERVER-AD\Users\Administrador\Documents\PerfilesMoviles"

# Nombre de la carpeta compartida
$ShareName = "PerfilesMoviles"

# Verificar y crear la carpeta base para los perfiles m�viles si no existe
if (-not (Test-Path -Path $BasePath -PathType Container)) {
    New-Item -Path $BasePath -ItemType Directory
    Write-Host "Se ha creado la carpeta base para perfiles m�viles en '$BasePath'."
} else {
    Write-Host "La carpeta base para perfiles m�viles en '$BasePath' ya existe."
}
# Compartir la carpeta base para los perfiles m�viles si no est� compartida
if (-not (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue)) {
    New-SmbShare -Name $ShareName -Path $BasePath -FullAccess Everyone
    Write-Host "Se ha compartido la carpeta '$ShareName' como '$BasePath'."
} else {
    Write-Host "La carpeta '$ShareName' ya est� compartida."
}
# Obtener todos los usuarios del dominio para los cuales se crear�n perfiles m�viles
$Usuarios = Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName

# Iterar sobre la lista de usuarios y crear perfiles m�viles
foreach ($Usuario in $Usuarios) {
    $ProfilePath = Join-Path -Path $BasePath -ChildPath $Usuario

    # Verificar y crear la carpeta para el perfil m�vil del usuario si no existe
    if (-not (Test-Path -Path $ProfilePath -PathType Container)) {
        New-Item -Path $ProfilePath -ItemType Directory
        Write-Host "Se ha creado la carpeta para el perfil m�vil de $Usuario en '$ProfilePath'."
    } else {
        Write-Host "La carpeta para el perfil m�vil de $Usuario ya existe en '$ProfilePath'."
    }
}
Write-Host "Se han creado las carpetas para los perfiles m�viles de los usuarios del dominio."