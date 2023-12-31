Connect-ExchangeOnline
$mailboxes = get-mailbox 
$outfile = "C:\temp\mailboxrules"+(get-accepteddomain | where {$_.Default -eq $True} | select -expand domainname)+(get-date -format MM-dd-yy)+".txt"
"Generating Inbox Rule Report at " + $outfile
"Please be patient this can take some time"
foreach ($mailbox in $mailboxes)
{
"Mailbox Address: " + $mailbox.primarySMTPaddress  >> $outfile
get-inboxrule -mailbox $mailbox.PrimarySmtpAddress |
    foreach{
        "Rule Name: " + $_.name >> $outfile
        "Enabled: " + $_.enabled>> $outfile
        $_ | select -expand description >> $outfile
    }
}

"Report is ready for review"