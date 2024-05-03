# Configurar la dirección IP estática
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.56.100" -PrefixLength 24 -DefaultGateway "192.168.56.1"

# Configurar la dirección de servidor DNS
Set-DNSClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "8.8.8.8"

# Cambiar el nombre del PC
Rename-Computer -NewName "WinServer-AD" -Restart
