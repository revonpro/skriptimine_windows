# loome_kasutaja_ja_parool
$kasutajaParool = ConvertTo-Securestring "Parool1!" -AsPlainText -Force
# küsime kasutaja andmed
$Eesnimi = Read-Host "Sisesta oma Eesnimi"
$Perenimi = Read-Host "Sisesta oma Perenimi"
# loome_kasutajanimi
$kasutajanimi = $Eesnimi.ToLower() + "." + $Perenimi.ToLower()
# taisnime loomine
$Taisnimi = $Eesnimi + "." + $Perenimi
# kontokirjeldus
$kasutajakirjeldus = "lokaalne_konto -" + $kasutajanimi
New-localUser $kasutajanimi -Password $kasutajaparool -FullName $Taisnimi -Description $kasutajakirjeldus
if(!$?){
    Write-output "tekkinud probleem kasutaja loomisega"

}
# süsteemi teaded tagasi sisse
$ErrorActionPreference = 'stop'