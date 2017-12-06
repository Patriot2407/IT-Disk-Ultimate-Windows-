<#Change this variable to your desired domain controller#>
$DomainController = "SERVER" <#--------- Must be in quotes#>

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
Write-Host "User name entered: $UserName"
try
{
$UserFQDN = dsquery user -samid $UserName
Write-Host "The FQDN for $UserName is: $UserFQDN"
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
$result = repadmin /showobjmeta $DomainController "$UserFQDN"
Write-Host $result
$Exit = Read-host -Prompt "Press ENTER to exit"
<#Remove-PSSession $Session#>
exit