$Enrollments = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Enrollments | Where-Object {$_.Property -eq "UPN"}
If ($Enrollments.PSChildName) {
    Remove-Item HKLM:\SOFTWARE\Microsoft\Enrollments\$($Enrollments.PSChildName) -Recurse
}

