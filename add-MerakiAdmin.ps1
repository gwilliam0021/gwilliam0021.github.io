$apikey = read-host "Enter your API Key"
$targetemail = read-host "Enter the email of the user to add"
$targetname = read-host "Enter the first and last name of the user to add"
$orgAccess = "full"
$orgs = invoke-restmethod -uri https://api.meraki.com/api/v1/organizations -method get -headers $headers$

$headers = @{"X-Cisco-Meraki-API-Key" = "$apikey";"Content-Type" = "application/json"}
$body = @{"email" = "$targetemail";"name" = "$targetname"; "orgAccess" = "full"}
$body = $body | ConvertTo-Json
$orgs | foreach-object {
  
 
        invoke-restmethod -uri https://api.meraki.com/api/v1/organizations/$($_.id)/admins -method post -headers $headers -Body $body
        }
