# Definir las credenciales del administrador del dominio
$credential = Get-Credential

# Lista de usuarios y sus cuentas SAM
$usuarios = @{
    "Neus Cháfer Sanjuan" = "nchafer";
    "Juan Pablo Lopez" = "jlopez";
    "Marta Garcia Miravalles" = "mgarcia";
    "Lorena Girona Marquez" = "lmarquez";
    "Estela Gimenez Pastor" = "egimenez";
    "Jorge Mateu Estubeny" = "jmateu";
    "Macarena Quesada Colomar" = "mquesada";
    "Oscar Juarez Moreno" = "ojuarez";
    "Javier Gómez Martinez" = "jgomez";
    "Noelia Molina Sanjuán" = "nmolina";
    "Pablo Cháfer Rey" = "pcháfer";
    "Sergio Climente Valles" = "sclimente";
    "Julia Vidal Hernández" = "jvidal";
    "Gimeno Ramir Aguado" = "gramir";
    "Rafa Nadal Perales" = "rnadal";
    "Esmeralda Virginia Bataller" = "evbataller";
    "Victor Ramos Alvino" = "vramos";
    "Marta Carpi Estocolmo" = "mcarpi";
    "Raúl Ferrer Mateu" = "rferrer";
    "Perla Bilal Molina" = "pbilal";
    "David Requena Morella" = "drequena";
    "Pedro Sanchez Cucarella" = "psanchez";
    "Silvia Gimenez Sanchis" = "sgimenez";
    "Esther Llutx Llorens" = "ellutx";
    "Carlos Balaguer Corber" = "cbalaguer";
    "Virginia Bataller Alventosa" = "vbalaller";
    "Rafa Murillo Carpio" = "rmurillo";
    "Enrique Iglesias Perez" = "eiglesias"
}

# Iterar sobre cada usuario y establecer la contraseña
foreach ($userFullName in $usuarios.Keys) {
    $samAccountName = $usuarios[$userFullName]
    $newPassword = ConvertTo-SecureString "20012506N." -AsPlainText -Force

    # Establecer la contraseña inicial
    Set-ADAccountPassword -Identity $samAccountName -NewPassword $newPassword -Reset

    # Habilitar la cuenta de usuario
    Enable-ADAccount -Identity $samAccountName

    Write-Host "Se ha configurado la cuenta de $userFullName ($samAccountName) para iniciar sesión con la contraseña inicial."
}
