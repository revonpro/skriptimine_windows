# vajalikud parameetrid
param(
$Kasutajanimi,
$Taisnimi,
$Kontokirjeldus
)
# loome kastaja jaoks parooli 
$Kasutajaparool = ConvertTo-SecureString 'Parool1' -AsPlainText -Force
#loome kasutaja
New-LocalUser $Kasutajanimi -Password $Kasutajaparool -FullName $Taisnimi -Description $Kontokirjeldus