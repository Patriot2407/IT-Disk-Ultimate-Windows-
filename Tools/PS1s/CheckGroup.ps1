cls
$GroupName = Read-host -Prompt "Enter Group name to check"
try
{
Get-ADGroupMember $GroupName -Recursive | Select DistinguishedName
}
catch
{
write-host "ERROR DETECTED!" -ForegroundColor Red
<# write-host "$($_.Exception.GetType().FullName)" -ForegroundColor Red #>
write-host "$($_.Exception.Message)" -ForegroundColor Red
$ErrorExit = Read-host -Prompt "Press ENTER to acknowledge and exit"
exit
exit
exit
}
$exit = Read-host -Prompt "Press ENTER"
exit