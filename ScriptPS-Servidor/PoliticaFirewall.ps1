# Definir las reglas de firewall para permitir acceso a Internet
$FirewallRules = @{
    "AllowInternetTCP" = @{
        DisplayName = "Allow Internet TCP"
        Protocol = "TCP"
        RemoteAddress = "Any"
        RemotePort = "Any"
        Direction = "Outbound"
        Action = "Allow"
    }
    "AllowInternetUDP" = @{
        DisplayName = "Allow Internet UDP"
        Protocol = "UDP"
        RemoteAddress = "Any"
        RemotePort = "Any"
        Direction = "Outbound"
        Action = "Allow"
    }
}

# Crear la nueva GPO llamada "PoliticaFirewall"
$NewGPO = New-GPO -Name "PoliticaFirewall"

# Asignar las reglas de firewall a la nueva GPO
foreach ($rule in $FirewallRules.GetEnumerator()) {
    $RuleName = $rule.Key
    $RuleProperties = $rule.Value
    New-NetFirewallRule -DisplayName $RuleProperties.DisplayName -Name $RuleName -Protocol $RuleProperties.Protocol -RemoteAddress $RuleProperties.RemoteAddress -RemotePort $RuleProperties.RemotePort -Direction $RuleProperties.Direction -Action $RuleProperties.Action -Profile Any -Enabled True
    Set-GPRegistryValue -Name $NewGPO.DisplayName -Key "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" -ValueName "EnableFirewall" -Type DWord -Value 1
}

# Obtener las OUs específicas en el dominio
$OUs = Get-ADOrganizationalUnit -Filter * -SearchBase "OU=ou.SST,DC=dom,DC=SST"

# Vincular la nueva GPO a todas las OUs del dominio
foreach ($OU in $OUs) {
    try {
        New-GPLink -Name "PoliticaFirewall" -Target $OU.DistinguishedName -LinkEnabled Yes -ErrorAction Stop
        Write-Host "La GPO 'PoliticaFirewall' se ha vinculado correctamente a la OU $($OU.DistinguishedName)."
    } catch {
        Write-Host "Error al vincular la GPO 'PoliticaFirewall' a la OU $($OU.DistinguishedName): $_"
    }
}

Write-Host "Se ha aplicado la política de Firewall para permitir acceso a Internet a todas las unidades organizativas del dominio."