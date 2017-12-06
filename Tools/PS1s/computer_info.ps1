cls
Write-Host "Computer info"
Write-Host "--------------"
Get-WmiObject -Class Win32_ComputerSystem
Get-WmiObject -Class Win32_Bios -ComputerName .
Write-Host ""
$Exit = Read-host -Prompt "Press ENTER to exit"
exit