Write-Host "Loading..."
Import-Module activedirectory
cls
$DC = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().DomainControllers
write-host "Domain Controllers Detected :"
Write-host "$DC"
Write-host ""
$Exit = Read-host -Prompt "Press ENTER to exit"
exit