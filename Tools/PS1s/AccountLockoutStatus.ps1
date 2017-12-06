<#------------------Do not edit below this line-----------------------#>
Clear-Host
<#$DC = Read-host -Prompt "Enter a Domain Controller Name:"#>
<#
$Session = New-PSSession -Computer $DomainController
Enter-PSSession $Session
wmic os get version
Set-Location c:\
#>
Write-Host "Loading..."
Import-Module activedirectory
cls
$UserName = Read-host -Prompt "Enter User name"
Clear-Host
Write-Host "Is $Username locked out?"
try
{
$result = (Get-Aduser $UserName -Properties LockedOut).LockedOut
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
Write-Host "Server response = "$result
Write-Host ""
$Exit = Read-host -Prompt "Press ENTER to exit"
<#Remove-PSSession $Session#>
exit
exit
exit