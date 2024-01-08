$apikey = read-host "Enter your API Key"
$targetemail = read-host "Enter the email of the user to add"
$targetname = read-host "Enter the first and last name of the user to add"
$orgAccess = "full"
$orglist = @(870756,766019,660903245316623094,700872692009533959,700872692009533866,686235993220581290,686235993220580581,686235993220580371,686235993220580365,465528,658088495549516622,658088495549516324,658088495549516331,658088495549516210,658088495549516196,658088495549515734,658088495549515764,658088495549515517,490429,658088495549515375,655836695735828826,575334852396583135,575334852396582768,575334852396583407,575334852396583137)

$headers = @{"X-Cisco-Meraki-API-Key" = "$apikey";"Content-Type" = "application/json"}
$body = @{"email" = "$targetemail";"name" = "$targetname"; "orgAccess" = "full"}
$body = $body | ConvertTo-Json
$orglist | foreach-object {
  
 
        invoke-restmethod -uri https://api.meraki.com/api/v1/organizations/$_/admins -method post -headers $headers -Body $body
        }
