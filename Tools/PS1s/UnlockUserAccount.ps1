cls
$UserName = Read-host -Prompt "Enter User that is locked out "
try
{
get-ADuser $UserName -prop PasswordExpired
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
Unlock-ADAccount $UserName
write-host "$UserName's account was successfully unlocked!" -ForegroundColor green
$Exit = Read-host -Prompt "Press ENTER"
exit