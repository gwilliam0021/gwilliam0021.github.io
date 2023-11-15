wmic product where 'name = "Egress"' call uninstall | Out-Default
start-sleep -seconds 30
invoke-webrequest -uri "https://www.egress.com/media/adenkiml/egressemailprotection-23-09-1371.msi" -OutFile "C:\temp\egress.msi"
msiexec /i "C:\temp\egress.msi" /qn