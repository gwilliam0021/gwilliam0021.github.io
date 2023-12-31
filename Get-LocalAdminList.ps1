$localhost = hostname
$outputstring = ""
$localadmins = get-CimInstance -query "associators of {win32_group.domain='$localhost',Name='administrators'} where Role=GroupComponent"
foreach ($localadmin in $localadmins)
{
$outputstring = $outputstring + $localadmin.caption + ", "
}
return $outputstring