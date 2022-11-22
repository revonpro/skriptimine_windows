# location of AD users file
$file = "C:\Users\Administrator\Documents\adusers.csv"
# import file content
$users = Import-Csv $file -Encoding Default -Delimiter ";"
# foreach user data row in file
foreach ($user in $users){
    # username is firstname.lastname
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    # user principal name
    $upname = $username + "@sv-kool.local"
    # display name - eesnimi + perenimi
    $displayname = $user.FirstName + " " + $user.LastName
    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) -Enabled $true 
}
#function translit UTF-8 characters to LATIN
function Translit {
    # function use as parameter string to translit
    param(
        [string] $inputString
    )
    # define the characters wich have to be translited
    $Translit = @{
    [char]'ä' = "a"
    [char]'ö' = "o"
    [char]'ü' = "u"
    [char]'õ' = "o"
    }
    # create translited output
    $outputstring=""
    # transfer string to array of characters and by chatacter
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        #if character is exists in list of characters of transliting
        if ($Translit[$character] -cne $Null ){
            # add to output translited character
            $outputString += $Translit[$character]
        } else {
            # otherwise add the initial character
            $outputString += $character
        }
    }
    Write-Output $outputString
}