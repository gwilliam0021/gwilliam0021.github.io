$apikey = read-host "Enter your API Key"
$targetemail = read-host "Enter the email you would like to remove from your organizations"

$headers = @{"X-Cisco-Meraki-API-Key" = "$apikey"}
$orglist = invoke-restmethod -uri https://api.meraki.com/api/v1/organizations -method get -headers $headers
$orglist | foreach-object {
    $orgid = $_ |select-object -ExpandProperty id
    $adminlist = invoke-restmethod -uri https://api.meraki.com/api/v1/organizations/$orgid/admins -method Get -headers $headers
    $adminID = $adminlist | select-object email,id | where-object {$_.email -eq "$targetemail"} | select-object -expandproperty id
    write-host $_.name "has user listed as ID $adminID"
    if ($adminid -gt 10)
        {
        invoke-restmethod -uri https://api.meraki.com/api/v1/organizations/$orgid/admins/$adminID -method delete -headers $headers
        }
}