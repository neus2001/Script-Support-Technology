# Definir los nombres completos de las OUs
$ouDesarrollo = "OU=ou.Desarrollo,OU=ou.SST,DC=dom,DC=SST"
$ouSoporteTecnico = "OU=ou.SoporteTecnico,OU=ou.SST,DC=dom,DC=SST"
$ouVentasyMarketing = "OU=ou.VentasyMarketing,OU=ou.SST,DC=dom,DC=SST"
$ouAdminyFinanzas = "OU=ou.AdminyFinanzas,OU=ou.SST,DC=dom,DC=SST"
$ouAdminSistemas = "OU=ou.AdminSistemas,OU=ou.SST,DC=dom,DC=SST"


# Crear los usuarios para AdminSistemas
New-ADUser -Name "Neus Cháfer Sanjuan" -SamAccountName "nchafer" -Path $ouAdminSistemas


# Crear los usuarios para Desarrollo
New-ADUser -Name "Juan Pablo Lopez" -SamAccountName "jlopez" -Path $ouDesarrollo
New-ADUser -Name "Marta Garcia Miravalles" -SamAccountName "mgarcia" -Path $ouDesarrollo
New-ADUser -Name "Lorena Girona Marquez" -SamAccountName "lmarquez" -Path $ouDesarrollo
New-ADUser -Name "Estela Gimenez Pastor" -SamAccountName "egimenez" -Path $ouDesarrollo
New-ADUser -Name "Jorge Mateu Estubeny" -SamAccountName "jmateu" -Path $ouDesarrollo
New-ADUser -Name "Macarena Quesada Colomar" -SamAccountName "mquesada" -Path $ouDesarrollo
New-ADUser -Name "Oscar Juarez Moreno" -SamAccountName "ojuarez" -Path $ouDesarrollo

# Crear los usuarios para SoporteTecnico
New-ADUser -Name "Javier Gómez Martinez" -SamAccountName "jgomez" -Path $ouSoporteTecnico
New-ADUser -Name "Noelia Molina Sanjuán" -SamAccountName "nmolina" -Path $ouSoporteTecnico
New-ADUser -Name "Pablo Cháfer Rey" -SamAccountName "pcháfer" -Path $ouSoporteTecnico
New-ADUser -Name "Sergio Climente Valles" -SamAccountName "sclimente" -Path $ouSoporteTecnico
New-ADUser -Name "Julia Vidal Hernández" -SamAccountName "jvidal" -Path $ouSoporteTecnico
New-ADUser -Name "Gimeno Ramir Aguado" -SamAccountName "gramir" -Path $ouSoporteTecnico
New-ADUser -Name "Rafa Nadal Perales" -SamAccountName "rnadal" -Path $ouSoporteTecnico

# Crear los usuarios para VentasyMarketing
New-ADUser -Name "Esmeralda Virginia Bataller" -SamAccountName "evbataller" -Path $ouVentasyMarketing
New-ADUser -Name "Victor Ramos Alvino" -SamAccountName "vramos" -Path $ouVentasyMarketing
New-ADUser -Name "Marta Carpi Estocolmo" -SamAccountName "mcarpi" -Path $ouVentasyMarketing
New-ADUser -Name "Raúl Ferrer Mateu" -SamAccountName "rferrer" -Path $ouVentasyMarketing
New-ADUser -Name "Perla Bilal Molina" -SamAccountName "pbilal" -Path $ouVentasyMarketing
New-ADUser -Name "David Requena Morella" -SamAccountName "drequena" -Path $ouVentasyMarketing
New-ADUser -Name "Pedro Sanchez Cucarella" -SamAccountName "psanchez" -Path $ouVentasyMarketing
New-ADUser -Name "Silvia Gimenez Sanchis" -SamAccountName "sgimenez" -Path $ouVentasyMarketing

# Crear los usuarios para AdminyFinanzas
New-ADUser -Name "Esther Llutx Llorens" -SamAccountName "ellutx" -Path $ouAdminyFinanzas
New-ADUser -Name "Carlos Balaguer Corber" -SamAccountName "cbalaguer" -Path $ouAdminyFinanzas
New-ADUser -Name "Virginia Bataller Alventosa" -SamAccountName "vbalaller" -Path $ouAdminyFinanzas
New-ADUser -Name "Rafa Murillo Carpio" -SamAccountName "rmurillo" -Path $ouAdminyFinanzas
New-ADUser -Name "Enrique Iglesias Perez" -SamAccountName "eiglesias" -Path $ouAdminyFinanzas
