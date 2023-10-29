while ($true)
{    
    if (test-connection 10.10.12.1 -ne $True){Write-EventLog -LogName "Application" -Source "VPNDiagnostics" -EventID 1001 -Message "Site to site down, Gwinnett"}
    if (test-connection 10.10.11.1 -ne $True){Write-EventLog -LogName "Application" -Source "VPNDiagnostics" -EventID 1002 -Message "Site to site down, Fulton"}
}
