# Agregar los usuarios a sus respectivos grupos

# Desarrollo
Add-ADGroupMember -Identity "g.Desarrollo" -Members "jlopez", "mgarcia", "lmarquez", "egimenez", "jmateu", "mquesada", "ojuarez"

# Soporte Técnico
Add-ADGroupMember -Identity "g.SoporteTecnico" -Members "jgomez", "nmolina", "pcháfer", "sclimente", "jvidal", "gramir", "rnadal"

# Ventas y Marketing
Add-ADGroupMember -Identity "g.VentasyMarketing" -Members "evbataller", "vramos", "mcarpi", "rferrer", "pbilal", "drequena", "psanchez", "sgimenez"

# Administración y Finanzas
Add-ADGroupMember -Identity "g.AdminyFinanzas" -Members "ellutx", "cbalaguer", "vbalaller", "rmurillo", "eiglesias"

# AdminSistemas
Add-ADGroupMember -Identity "g.AdminSistemas" -Members "nchafer"
