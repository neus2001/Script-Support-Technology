# Unión al dominio
$domainName = "Dom.SST"
$credential = Get-Credential
Add-Computer -DomainName $domainName -Credential $credential -Restart
