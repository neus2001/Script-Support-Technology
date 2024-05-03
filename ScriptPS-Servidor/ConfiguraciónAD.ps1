# Instalación del Rol de Active Directory
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Promoción del Servidor a Controlador de Dominio
Install-ADDSForest -DomainName "Dom.SST" -SafeModeAdministratorPassword (ConvertTo-SecureString "20012506N." -AsPlainText -Force)
