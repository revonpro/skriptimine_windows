#kustutab kasutaja ees ja perenime järgi
$Eesnimi = Read-Host "Sisesta oma Eesnimi"
$Perenimi = Read-Host "Sisesta oma Perenimi"
#kasutajanimi
$kasutajanimi = $Eesnimi.ToLower() + "." + $Perenimi.ToLower()
$ErrorActionPreference = "SilentlyContinue"
#konto_kustutamine
Remove-LocalUser  $kasutajanimi
if(!$?){

Echo "Viga! kontot ei eksisteeri."
}
else
{
Echo "Konto $kasutajanimi on kustutatud"
}
$ErrorActionPreference = "Stop"