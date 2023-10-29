$vpnConnections = get-vpnconnection -alluserconnection  
foreach ($vpnconnection in $vpnconnections)
{ 
$vpnconnection | set-vpnconnection -splittunneling $true -encryptionlevel optional
}