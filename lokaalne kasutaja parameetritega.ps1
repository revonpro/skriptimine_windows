    #kontroll parameetrite arvule 
if ($args.Count -ne 3){
    echo ".\skriptifailinimi.ps1 kasutajanimi taisnimi kirjeldus" 
} else {
    # vajalikud parameetrid
    $Kasutajanimi = $args[0]
    $Taisnimi = $args[1]
    $Kontokirjeldus = $args[2]
    # loome kastaja jaoks parooli 
$Kasutajaparool = ConvertTo-SecureString 'Parool1' -AsPlainText -Force
    # loome kasutaja
New-LocalUser $Kasutajanimi -Password $Kasutajaparool -FullName $Taisnimi -Description $Kontokirjeldus
}