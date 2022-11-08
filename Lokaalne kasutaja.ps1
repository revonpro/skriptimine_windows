# Loome kasutaja jaoks parooli
$KasutajaParool = ConvertTo-Securestring 'Parool1' -AsPlainText -Force
# Toome kasutaja
New-LocalUser 'Kasutaja1' -Password $KasutajaParool -Fullname 'Esimene kasutaja' -Description 'Local account'