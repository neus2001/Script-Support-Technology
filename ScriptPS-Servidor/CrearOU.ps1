# Crear la OU principal ou.SST
New-ADOrganizationalUnit -Name "ou.SST" -Path "DC=dom,DC=SST"

# Crear las OUs secundarias dentro de ou.SST
New-ADOrganizationalUnit -Name "ou.Desarrollo" -Path "OU=ou.SST,DC=dom,DC=SST"
New-ADOrganizationalUnit -Name "ou.SoporteTecnico" -Path "OU=ou.SST,DC=dom,DC=SST"
New-ADOrganizationalUnit -Name "ou.VentasyMarketing" -Path "OU=ou.SST,DC=dom,DC=SST"
New-ADOrganizationalUnit -Name "ou.AdminyFinanzas" -Path "OU=ou.SST,DC=dom,DC=SST"
New-ADOrganizationalUnit -Name "ou.AdminSistemas" -Path "OU=ou.SST,DC=dom,DC=SST"
