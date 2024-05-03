# Configuración de la dirección IP y otros parámetros de red
$ipAddress = "192.168.0.31"
$subnetMask = "255.255.255.0"
$gateway = "192.168.0.30"  # Dirección IP del adaptador de red interno del servidor
$dnsServer = "192.168.0.30"  # Dirección IP del servidor DNS del dominio

# Configuración de la dirección IP
$networkAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
New-NetIPAddress -InterfaceIndex $networkAdapter.InterfaceIndex -IPAddress $ipAddress -PrefixLength 24 -DefaultGateway $gateway

# Configuración del servidor DNS
Set-DnsClientServerAddress -InterfaceIndex $networkAdapter.InterfaceIndex -ServerAddresses $dnsServer

# Eliminar la dirección IP (..) si está presente
Get-NetIPAddress -IPAddress "192.168.0.3" | Remove-NetIPAddress -Confirm:$false

# Cambio de nombre del equipo
#Rename-Computer -NewName "Win10-Cliente1" -Restart
