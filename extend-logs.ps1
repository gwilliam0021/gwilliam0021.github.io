﻿Limit-EventLog -LogName Security -maximumsize 512MB
Limit-EventLog -LogName Application -MaximumSize 256KB
Limit-EventLog -logname System -MaximumSize 256KB
Limit-EventLog -LogName 'Windows PowerShell' -MaximumSize 256KB
    param (
        [string]$PolicyName
    )