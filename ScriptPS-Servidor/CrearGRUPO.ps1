# Definir los nombres completos de las OU
$ouDesarrollo = "OU=ou.Desarrollo,OU=ou.SST,DC=dom,DC=SST"
$ouSoporteTecnico = "OU=ou.SoporteTecnico,OU=ou.SST,DC=dom,DC=SST"
$ouVentasyMarketing = "OU=ou.VentasyMarketing,OU=ou.SST,DC=dom,DC=SST"
$ouAdminyFinanzas = "OU=ou.AdminyFinanzas,OU=ou.SST,DC=dom,DC=SST"
$ouAdminSistemas = "OU=ou.AdminSistemas,OU=ou.SST,DC=dom,DC=SST"

# Definir los nombres de los grupos
$grupoDesarrollo = "g.Desarrollo"
$grupoSoporteTecnico = "g.SoporteTecnico"
$grupoVentasyMarketing = "g.VentasyMarketing"
$grupoAdminyFinanzas = "g.AdminyFinanzas"
$grupoAdminSistemas = "g.AdminSistemas"

# Crear los grupos para cada OU
New-ADGroup -Name $grupoDesarrollo -GroupCategory Security -GroupScope Global -Path $ouDesarrollo
New-ADGroup -Name $grupoSoporteTecnico -GroupCategory Security -GroupScope Global -Path $ouSoporteTecnico
New-ADGroup -Name $grupoVentasyMarketing -GroupCategory Security -GroupScope Global -Path $ouVentasyMarketing
New-ADGroup -Name $grupoAdminyFinanzas -GroupCategory Security -GroupScope Global -Path $ouAdminyFinanzas
New-ADGroup -Name $grupoAdminSistemas -GroupCategory Security -GroupScope Global -Path $ouAdminSistemas
